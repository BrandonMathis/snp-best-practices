deploy_to = ENV['DEPLOY_TO']
worker_processes Integer(ENV['WORKER_COUNT'] || 2)

preload_app true
timeout 30

GC.respond_to?(:copy_on_write_friendly=) &&
    GC.copy_on_write_friendly = true

listen "#{deploy_to}/shared/tmp/sockets/unicorn.sock", backlog: 1024

working_directory "#{deploy_to}/current"
pid               "#{deploy_to}/shared/tmp/pids/unicorn.pid"
stderr_path       "#{deploy_to}/shared/log/unicorn.stderr.log"
stdout_path       "#{deploy_to}/shared/log/unicorn.stdout.log"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      Process.kill('QUIT', File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end
