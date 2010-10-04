module Cucumba
  class Rails
    class Model

      class NotFoundError < Exception
      end

      def initialize(model_name,server)
	@server = server
	if @server.has_model?(model_name)
	  @model = model_name
	else
	  raise NotFoundError
	end
      end

      def method_missing(method,*args)
        if @server.model_has_method?(@model,method)
	  @server.invoke_method_on_model(@model,method,args)
	else
	  super
	end
      end
    end
  end
end
