require 'cucumba'

module Cucumba

  # run all cucumba servers that should be run(:run => true)
  def self.servers_start!
    config.each do |server_config|
      Cucumba[server_config[:name]].rails_stop!
      Cucumba[server_config[:name]].rails_start!
    end
  end

  def self.servers_stop!
    config.each { |server_config| Cucumba[server_config[:name]].rails_stop! }
  end

end
