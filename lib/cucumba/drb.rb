require 'cucumba'
require 'drb'

module Cucumba
  class Drb
    class Server
    end
  end
end

begin
  DRb.start_service(Cucumba[:_self_].drb_url, Cucumba::Drb::Server.new) if Cucumba[:_self_].run?
rescue Errno::EADDRINUSE
end
