require 'spec'
require 'spec/rake/spectask'

namespace :spec do

  desc "Run the specs for configuration"
  Spec::Rake::SpecTask.new(:config) do |t|
    t.spec_opts = ['--options', "spec/spec.opts"]
    t.spec_files = FileList['spec/*_spec.rb']
  end

  desc "Run the specs with running test rails app"
  Spec::Rake::SpecTask.new(:rails) do |t|
    t.spec_opts = ['--options', "spec/spec.opts"]
    t.spec_files = FileList['spec/*_spec_rails.rb']
  end
end
