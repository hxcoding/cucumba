module Cucumba
  class Railz
    # This class represents some object in rails application
    class Klass

      class NotFoundError < Exception
      end

      def initialize(constant,server)
	@server = server
	if @server.has_constant?(constant)
	  @constant = constant
	else
	  raise NotFoundError
	end
      end

      def method_missing(method,*args)
        if @server.constant_has_method?(@constant,method)
	  @server.invoke_method_on_constant(@constant,method,args)
	else
	  super
	end
      end
    end
  end
end
