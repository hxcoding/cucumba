begin
  require 'spec'
rescue LoadError
  require 'rubygems' unless ENV['NO_RUBYGEMS']
  gem 'rspec'
  require 'spec'
end

require 'net/http'
$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'cucumba'

begin
  Net::HTTP.start('127.0.0.1', 5001) { |http| http.get('/') }
rescue Errno::ECONNREFUSED
  puts <<EOF
  ##########################################
  # YOU FORGOT TO RUN SAMPLE RAILS SERVER! #
  ##########################################
  ./spec/support/sample_app_run.sh
EOF
  exit 1
end
