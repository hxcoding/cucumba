module Cucumba
  class Rails
    class Model
      class NoMethodError < ::NoMethodError
      end

      def initialize(model_name,server)
	model = model.to_s
	if server.has_model?(model)
	  @model = model
	else
	  raise "FIXME"
	end
      end
    end
  end
end
