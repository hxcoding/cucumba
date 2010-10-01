require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Cucumba configuration" do
  def load_fake_rails_module
    Object.const_set "Rails", Module.new
  end

  def remove_fake_rails_module
    Object.send :remove_const, :Rails
  end

  def force_cucumba_reload_config
    Cucumba.send :class_variable_set, :@@config, nil
  end

  before :all do
    load_fake_rails_module
  end

  before :each do
    force_cucumba_reload_config
    @good_config = [{
      :name => 'name',
      :host => 'some.host',
      :port => 4321,
      :desc => 'description',
      :env  => 'test',
      :run  => true
      #TODO :ssl => false
    }]
  end

  context "good configuration" do
    it "one server" do
      YAML.should_receive(:load_file).once.and_return(@good_config)
      Rails.should_receive(:root).and_return('/path/to/rails/app')

      [:name, "name"].each do |server|
	client = Cucumba[server]

	client.should be_instance_of(Cucumba::Rails)
	client.host.should == 'some.host'
	client.port.should == 4321
	client.rails_root == '/path/to/rails/app'
	client.drb_port.should == 5321
	client.url.should == 'http://some.host:4321'
	client.drb_url.should == 'druby://some.host:5321'
	client.description.should == 'description'
	client.environment.should == 'test'
	client.run?.should be_true
      end
    end

    it "should not be runned if run false" do
      @good_config.first[:run]=false
      YAML.should_receive(:load_file).once.and_return(@good_config)
      Rails.should_receive(:root)
      Cucumba[:name].run?.should be_false
    end

    it "should be runned if undefined rails" do
      remove_fake_rails_module
      YAML.should_receive(:load_file).once.and_return(@good_config)
      Cucumba[:name].run?.should be_true
    end
  end

  context "bad configuration" do

    it "should raise exception if config not found" do
      Rails.should_receive(:root)
      YAML.should_receive(:load_file).once.and_raise(Errno::ENOENT)
      lambda { Cucumba[:some] }.should raise_exception(Cucumba::ConfigNotFound)
    end

    it "should raise exception if server not found in config" do
      Rails.should_receive(:root)
      YAML.should_receive(:load_file).once.and_return(@good_config)
      lambda { Cucumba[:wrong] }.should raise_exception(Cucumba::Rails::ServerNotFound)
    end

  end

  after :all do
    begin
      remove_fake_rails_module
    rescue NameError
    end
  end

end

describe 'Group without Rails' do
  it "should not have Rails" do
    defined?(Rails).should be_false
  end
end
