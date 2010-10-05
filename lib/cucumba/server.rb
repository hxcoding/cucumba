lib = File.expand_path(File.join(File.dirname(__FILE__),'..'))
$:.unshift(lib) unless $:.include?(lib)

require 'cucumba/railz/runner'

Cucumba.servers_start!
trap(:INT) do
  puts
  Cucumba.servers_stop!
  exit 0
end

puts "=> press Ctrl-C to exit and kill servers"
sleep
