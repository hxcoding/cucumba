require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Cucumba[:server]" do

  before :all do
    @pwd =  Dir.pwd; Dir.chdir('spec/support/sample_app')

    require 'active_record'

    active_record_config = YAML.load_file('config/database.yml')

    ActiveRecord::Base.establish_connection(active_record_config["test"])
    Dir[File.join('app/models/*.rb')].each { |model| load model }
  end

  it "should return instance of Cucumba::Railz" do
    Cucumba[:test].should be_instance_of(Cucumba::Railz)
  end

  context "#class" do

    it "should return instace of Cucumba::Railz::Klass" do
      [ Cucumba[:test].class("User"), Cucumba[:test].c("User"), Cucumba[:test].class(:User), Cucumba[:test].c(:User) ].each do |object|
	object.should be_instance_of(Cucumba::Railz::Klass)
      end
    end

    it "should invoke existing methods" do
      users_count_was = User.all.count
      Cucumba[:test].c("User").create!(:name => 'test user', :password => 'secret')
      (User.all.count - users_count_was).should == 1
      User.last.name.should == 'test user'
      User.last.password.should == 'secret'
    end

    it "should invoke method without arguments" do
      Cucumba[:test].c(:User).columns
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
      Cucumba[:test].c(:User).method_with_args(:name, :first => 'bla', :last => 'alb')
    end

    it "should raise exception if class does not exists" do
      lambda { Cucumba[:test].c("Unknown") }.should raise_exception(Cucumba::Railz::Klass::NotFoundError)
    end

    it "should raise exception if model's method does not exists" do
      lambda { Cucumba[:test].c(:User).blabla }.should raise_exception(NoMethodError)
    end

    it "should raise exception if exception appears on server" do
      lambda { Cucumba[:test].c(:User).create!(:password => 'secret') }.should raise_exception(RuntimeError,"ActiveRecord::RecordInvalid Validation failed: Name can't be blank")
    end

  end

  after :all do
    Dir.chdir @pwd
  end
end
