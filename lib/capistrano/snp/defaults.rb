namespace :load do
  task :defaults do
    # Basic settings
    set :repo_url, -> { "git@git.snpdev.ru:saltpepper/#{fetch(:application)}-api.git" }
    set :deploy_to, -> { "/var/www/#{fetch(:application)}/ss" }
    set :scm, :git
    set :keep_releases, 3

    # Linked files
    set :linked_files, %w{config/database.yml}

    # Linked dirs
    set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

    # ENV
    set :default_env, -> { {worker_count: 2, deploy_to: fetch(:deploy_to)} }
  end
end

Rake.application.options.trace = true
