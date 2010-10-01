require 'cucumba/rails/model'
module Cucumba
  # Cucumba rails client
  class Rails

    class ServerNotFound < Exception
    end

    attr_reader :host, :port, :description, :environment

    def initialize(config)
      @host = config[:host]
      @port = config[:port]
      @run = config[:run]
      @description = config[:desc]
      @environment = config[:env]
      if config[:path]
	@path = File.join(config[:path])
      else
	@path = File.join('.')
      end
      @path = File.expand_path(@path)
      @pid_file = File.join(@path,'tmp/pids/server.pid')
    end

    # url where rails application lives
    def url
      'http://'+@host+':'+@port.to_s
    end

    def run?
      @run
    end

    def model(model_name)
      Model.new(model_name)
    end
    alias :m :model

  end
end
