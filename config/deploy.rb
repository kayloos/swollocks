require "bundler/capistrano"
set :application, "swollocks.com"
set :user, "kalusn"
set :repository,  "git@github.com:kayloos/swollocks.git"
set :use_sudo, false
set :deploy_to, "/var/www/swollocks.com"


set :scm, :git
set :git_enable_submodules, 1
set :location, "178.79.141.237"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, location
role :app, location
role :db,  location, :primary => true # This is where Rails migrations will run


namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Make symlink for database.yml" 
  task :symlink_dbyaml do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
  end

  desc "Create empty database.yml in shared path" 
  task :create_dbyaml do
    run "mkdir -p #{shared_path}/config" 
    put '', "#{shared_path}/config/database.yml" 
  end
end
after 'deploy:setup', 'deploy:create_dbyaml'
after 'deploy:update_code', 'deploy:symlink_dbyaml'

after "deploy", "deploy:cleanup"
