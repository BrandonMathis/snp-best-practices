namespace :load do
  task :defaults do
    # config valid only for Capistrano 3.1
    lock '3.1.0'

    # basic settings
    set :deploy_to, -> { "/var/www/#{fetch(:application)}/ss" }
    set :scm, :git
    set :keep_releases, 3

    # asking password if needed
    set :password, ask('password', nil)

    # linked files
    set :linked_files, %w(config/database.yml)

    # linked dirs
    set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system)

    # custom environment
    set :default_env, -> { { worker_count: 2, deploy_to: fetch(:deploy_to) }.merge(fetch(:env) || Hash.new) }

    # capistrano-bundler settings
    set :bundle_binstubs, nil

    # capistrano-rbenv settings
    set :rbenv_type, :user
    set :rbenv_ruby, '2.1.0'
  end
end

Rake.application.options.trace = true
