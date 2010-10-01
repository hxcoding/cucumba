require 'drb'
DRb.start_service

module Cucumba
  class Rails
    class Model

      class NotFoundError < Exception
      end

      class NoMethodError < ::NoMethodError
      end

      def initialize(model_name,server_url)
	server = DRbObject.new(nil, server_url)
	if server.has_model?(model_name)
	  @model = model_name
	else
	  raise NotFoundError
	end
      end
    end
  end
end
