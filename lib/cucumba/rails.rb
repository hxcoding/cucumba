require 'drb'
require 'cucumba/rails/model'

module Cucumba
  # Cucumba rails client
  class Rails

    class ServerNotFound < Exception
    end

    attr_reader :host, :port, :drb_port, :description, :environment

    def initialize(config)
      @host = config[:host]
      @port = config[:port] || 80
      @drb_port = @port+1000
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
      @server = DRbObject.new(nil, drb_url)
    end

    # url where rails application lives
    def url
      'http://'+@host+':'+@port.to_s
    end

    def drb_url
      'druby://'+@host+':'+@drb_port.to_s
    end

    def rails_root
      @path
    end

    def run?
      @run
    end

    def model(model_name)
      Model.new(model_name,@server)
    end
    alias :m :model

    def execute(code)
      @server.execute(code)
    end
    alias :e :execute

  end
end

DRb.start_service
