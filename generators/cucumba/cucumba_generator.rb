class CucumbaGenerator < Rails::Generator::NamedBase
  attr_reader :server_names

  def initialize(runtime_args, runtime_options={})
    super
    @server_names = runtime_args.uniq
  end

  def manifest
    record do |m|
      m.directory "config"
      m.template 'config.yml', "config/cucumba.yml"
      m.directory "lib/tasks"
      m.file 'cucumba.rake', 'lib/tasks/cucumba.rake'
    end
  end

  private

  def banner
    'Usage: ./script/generate cucumba server1 server2 server3'
  end
end
