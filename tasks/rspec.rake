require 'spec'
require 'spec/rake/spectask'

unless File.exists?('.spec/spec.opts')
  Dir.mkdir('.spec') unless File.exists?('.spec')
  File.open('.spec/spec.opts','w') { |f| f.write('--color') }
end

Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', ".spec/spec.opts"]
  t.spec_files = FileList['spec/configuration_spec.rb','spec/rails_spec.rb']
end

task :default => :spec
