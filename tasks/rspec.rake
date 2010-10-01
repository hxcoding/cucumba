begin
  require 'rubygems' unless ENV['NO_RUBYGEMS']
  require 'spec'
  require 'spec/rake/spectask'
rescue LoadError
  puts <<-EOS
To use rspec for testing you must install rspec gem:
    gem install rspec
EOS
  exit(0)
end

namespace :spec do
  desc "Run the specs with running test rails app"
  Spec::Rake::SpecTask.new(:rails) do |t|
    t.spec_opts = ['--options', "spec/spec.opts"]
    t.spec_files = FileList['spec/*_spec_rails.rb']
  end

  desc "Run the specs for configuration"
  Spec::Rake::SpecTask.new(:config) do |t|
    t.spec_opts = ['--options', "spec/spec.opts"]
    t.spec_files = FileList['spec/*_spec.rb']
    p t.spec_files
  end
end
