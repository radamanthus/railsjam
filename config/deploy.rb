default_run_options[:pty] = true
ssh_options[:forward_agent] = true

#production

#staging
set :application, "railsjam"
set :domain, "railsjam.net"
set :user, "phruguser"
set :deploy_to, "~/#{domain}/"


set :scm, 'git'
set :scm_user, "phruggit"
set :scm_domain, "#{domain}"
set :repository,  "#{scm_user}@#{scm_domain}:~/#{application}.git"
set :deploy_via, :remote_cache

set :branch, 'master'
set :git_shallow_clone, 1
set :use_sudo, false


server domain, :app, :web
role :db, domain, :primary => true

namespace :deploy do
  task :restart do
    run "cd #{current_path} && mv #{current_path}/config/environment_production.rb #{current_path}/config/environment.rb && 
     mv #{current_path}/Gemfile_production #{current_path}/Gemfile &&  
     mv #{current_path}/config/boot_production.rb  #{current_path}/config/boot.rb && touch #{current_path}/tmp/restart.txt &&
     rm #{current_path}/public/stylesheets/all.css"
  end
end


after "deploy:symlink", "deploy:cleanup"
