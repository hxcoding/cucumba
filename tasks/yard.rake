begin
  require 'rubygems' unless ENV['NO_RUBYGEMS']
  require 'yard'
  require 'yard/rake/yardoc_task'
rescue LoadError
  puts <<-EOS
To use Yard for generating documentation you must install yard gem:
    gem install yard
EOS
  exit(0)
end
YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb', '-',$hoe.history_file]
end
