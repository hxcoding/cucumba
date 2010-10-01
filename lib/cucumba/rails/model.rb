module Cucumba
  class Rails
    class Model
      class NoMethodError < ::NoMethodError
      end

      def initialize(model_name,server_url)
	require 'drb'
	DRb.start_service
	model = model.to_s
	server = DRbObject.new(nil, server_url)
	if server.has_model?(model)
	  @model = model
	else
	  raise "FIXME"
	end
      end
    end
  end
end
