lib = File.expand_path(File.join(File.dirname(__FILE__),'../lib'))
$:.unshift(lib) unless $:.include?(lib)

require 'yaml'
require 'cucumba/rails'

module Cucumba

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
