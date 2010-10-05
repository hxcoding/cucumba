require 'cucumba'
require 'drb'

module Cucumba
  class Drb
    class Server
      def has_model?(model)
        Object.const_defined?(model.to_s.classify)
      end

      def model_has_method?(model,method)
        Object.const_get(model).respond_to?(method)
      end

      def invoke_method_on_model(model,method,*args)
	logger.info "Processing #{model}.#{method.to_s} (for TODO_IP at #{Time.now.strftime('%Y-%m-%d %H:%M:%S')}) [DRb]"
	Object.const_get(model).method(method).call(*args.first)
      rescue Exception => e
	handle_exception(e)
	raise RuntimeError, "#{e.class.to_s} #{e.message}"
      end

      def execute(code)
	logger.info "Evaluating code (for TODO_IP at #{Time.now.strftime('%Y-%m-%d %H:%M:%S')}) [DRb]"
	logger.info '---'
	logger.info code
	logger.info '---'
        Object.send :eval, code
      rescue Exception => e
	handle_exception(e)
	raise RuntimeError, e.message
      end

      private

      def logger
        RAILS_DEFAULT_LOGGER
      end

      def handle_exception(exception)
	logger.info "#{exception.class.to_s}: #{exception.message}"
	exception.backtrace.each { |t| logger.info t }
      end

    end
  end
end

begin
  DRb.start_service("druby://127.0.0.1:#{Cucumba[:_self_].drb_port}", Cucumba::Drb::Server.new) if Cucumba[:_self_].run?
rescue Errno::EADDRINUSE
  puts "=> Cucumba DRb server not starting, port #{Cucumba[:_self_].drb_port} already in use"
end
