require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path(File.dirname(__FILE__) + '/support/sample_app/config/environment')

describe "Cucumba[:server]" do

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
      Cucumba[:test].m("User").last.name.should == 'test user'
      Cucumba[:test].m("User").last.password.should == 'secret'
    end

    it "should invoke method without arguments" do
      Cucumba[:test].m(:User).columns
    end

    it "should raise exception if model does not exists" do
      lambda { Cucumba[:test].m("Unknown") }.should raise_exception(Cucumba::Rails::Model::NotFoundError)
    end

    it "should raise exception if model's method does not exists" do
      lambda { Cucumba[:test].m(:User).blabla }.should raise_exception(NoMethodError)
    end

  end
end
