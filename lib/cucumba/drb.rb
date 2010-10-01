require 'cucumba'
require 'drb'

module Cucumba
  class Drb
    class Server
      def has_model?(model)
        Object.const_defined?(model.to_s.classify)
      end

      private

      def logger
        RAILS_DEFAULT_LOGGER
      end
    end
  end
end

begin
  DRb.start_service(Cucumba[:_self_].drb_url, Cucumba::Drb::Server.new) if Cucumba[:_self_].run?
rescue Errno::EADDRINUSE
end
