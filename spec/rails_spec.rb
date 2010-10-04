require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Cucumba[:server]" do

  before :all do
    @pwd =  Dir.pwd; Dir.chdir('spec/support/sample_app')

    require 'active_record'

    active_record_config = YAML.load_file('config/database.yml')

    ActiveRecord::Base.establish_connection(active_record_config["test"])
    Dir[File.join('app/models/*.rb')].each { |model| load model }
  end

  it "should return instance of Cucumba::Rails" do
    Cucumba[:test].should be_instance_of(Cucumba::Rails)
  end

  context "#model" do

    it "should return instace of Cucumba::Rails::Model" do
      [ Cucumba[:test].model("User"), Cucumba[:test].m("User"), Cucumba[:test].model(:User), Cucumba[:test].m(:User) ].each do |model|
	model.should be_instance_of(Cucumba::Rails::Model)
      end
    end

    it "should invoke existing methods" do
      users_count_was = User.all.count
      Cucumba[:test].m("User").create!(:name => 'test user', :password => 'secret')
      (User.all.count - users_count_was).should == 1
      User.last.name.should == 'test user'
      User.last.password.should == 'secret'
    end

    it "should invoke method without arguments" do
      Cucumba[:test].m(:User).columns
    end

    it "should eval code in server side" do
      Cucumba[:test].execute("User.create!(:name => 'some name', :password => 'zecred')")
      User.last.name.should == 'some name'
      User.last.password == 'zecred'
    end

    it "should eval code and raise exception if exception appears on server side" do
      lambda { Cucumba[:test].e("UnknownModel") }.should raise_exception(RuntimeError)
    end

    it "should invoke this method" do
      Cucumba[:test].m(:User).method_with_args(:name, :first => 'bla', :last => 'alb')
    end

    it "should raise exception if model does not exists" do
      lambda { Cucumba[:test].m("Unknown") }.should raise_exception(Cucumba::Rails::Model::NotFoundError)
    end

    it "should raise exception if model's method does not exists" do
      lambda { Cucumba[:test].m(:User).blabla }.should raise_exception(NoMethodError)
    end

    it "should raise exception if exception appears on server" do
      lambda { Cucumba[:test].m(:User).create!(:password => 'secret') }.should raise_exception(RuntimeError,"ActiveRecord::RecordInvalid Validation failed: Name can't be blank")
    end

  end

  after :all do
    Dir.chdir @pwd
  end
end
