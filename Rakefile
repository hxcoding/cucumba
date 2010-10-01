require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/cucumba'

Hoe.plugin :newgem
Hoe.plugin :website

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'cucumba' do
  self.developer 'kucaahbe', 'kucaahbe@ukr.net'
  self.post_install_message = 'PostInstall.txt'#TODO edit this files
  self.rubyforge_name       = self.name
  # self.extra_deps         = [['activesupport','>= 2.0.2']]
  self.extra_dev_deps       = [
    ['yard',     '>= 0.6.1'],
    ['bluecloth',   '2.0.9'],
    ['rails',       '2.3.8'],
    ['sqlite3-ruby','1.3.1']
  ]
  self.history_file         = 'History.md'
  self.readme_file          = 'README.rdoc'
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

remove_task :default
remove_task :spec
task :default => ['spec:config', 'spec:rails']
