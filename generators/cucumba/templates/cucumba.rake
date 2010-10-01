namespace :cucumba do
  namespace :servers do
    desc "Run cucumba servers"
    task :run do
      require 'cucumba'
      Cucumba.run_servers!
      trap(:INT) do
	puts
	Cucumba.stop_servers!
	exit
      end
      puts "=> press Ctrl-C to exit and kill servers"
      sleep
    end
  end
end
