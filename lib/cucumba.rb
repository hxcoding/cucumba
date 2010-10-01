$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'yaml'
require 'cucumba/rails'

module Cucumba
  VERSION = '0.0.4'

  class ConfigNotFound < StandardError
  end

  # Usage:
  #
  #   Cucumba[:main]
  # or
  #
  #   Cucumba['main']
  #
  # where :main('main') is the
  # server name in config file.
  # Return Cucumba client instance
  def self.[] server_name
    server_name = server_name.to_s
    if server_name == "_self_"
      Cucumba::Rails.new(config.first)
    else
      Cucumba::Rails.new(config_for(server_name))
    end
  end

  # run all cucumba servers that should be run(:run => true)
  def self.run_servers!
    config.each do |server_config|
      Cucumba[server_config[:name]].rails_stop!
      Cucumba[server_config[:name]].rails_start!
    end
  end

  def self.stop_servers!
    config.each { |server_config| Cucumba[server_config[:name]].rails_stop! }
  end

  private

  def self.config_for(server_name)
    config.each do |server_config|
      if server_config[:name]==server_name
	return server_config
	break
      end
    end
    raise Cucumba::Rails::ServerNotFound, "server with '#{server_name}' not described in config file"
  rescue Errno::ENOENT  # yml file not found
    raise ConfigNotFound, "config not found, run 'cucumba' generator"
  end

  def self.config
    @@config ||= YAML.load_file(File.join((defined?(::Rails) ? ::Rails.root.to_s : Dir.pwd),'config','cucumba.yml'))
  end
end
