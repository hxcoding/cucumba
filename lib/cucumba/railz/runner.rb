require 'cucumba'
require 'net/http'

module Cucumba

  class Railz

    def rails_start!
      if run?
	puts "=> #{self.description} booting..."
	boot!
	wait_untill_alive!
      end
    end

    def rails_stop!
      pid = File.read(@pid_file).to_i
      puts "=> Killing alive server #{self.description}(pid:#{pid})"
      Process.kill('INT',pid)
    rescue Errno::ESRCH, Errno::ENOENT
      puts "=> Server #{self.description} is not running"
    end

    private

    def boot!
      cmd = "ruby #{File.join(@path,'script','server')}"
      cmd+= " --port=#{@port}"
      cmd+= " --daemon"
      cmd+= " --environment=#{@environment}"
      puts `#{cmd}`
    end

    def wait_untill_alive!
      check_start_time = Time.now
      loop do
	raise TimeoutError, "server #{self.description} start timeout" if (200-(Time.now.to_i - check_start_time.to_i)) <= 0
	if alive?
	  puts "=> #{self.description} alive!"
	  break
	else
	  sleep 0.2
	end
      end
    end

    def alive?
      Net::HTTP.start(@host, @port) { |http| http.get('/rails/info/properties') }
    rescue Errno::ECONNREFUSED, Errno::EBADF
      return false
    end

  end

  class <<self

    # run all cucumba servers that should be run(:run => true)
    def servers_start!
      config.each do |server_config|
	Cucumba[server_config[:name]].rails_stop!
	Cucumba[server_config[:name]].rails_start!
      end
    end
    alias :start_servers! :servers_start!

    def servers_stop!
      config.each { |server_config| Cucumba[server_config[:name]].rails_stop! }
    end
    alias :stop_servers! :servers_stop!

  end

end
