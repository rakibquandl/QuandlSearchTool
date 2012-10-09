#set :application, "search_tool"
#set :repository,  "https://github.com/rakibquandl/QuandlSearchTool"
#default_run_options[:pty] = true
#
#set :scm, "git"
#set :user, "deployer"  # The server's user for deploys
#set :scm_passphrase, ""  # The deploy user's password
#
## Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
#
#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

#if you want to clean up old releases on each deploy uncomment this:
#after "deploy:restart", "deploy:cleanup"

#if you're still using the script/reaper helper you will need
#these http://github.com/rails/irs_process_scripts
#
#If you are using Passenger mod_rails uncomment this:
#namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
#end

#require 'bundler/capistrano'
#
#set :application, "searchtool.com" # Your application location on your server goes here
#
#default_run_options[:pty] = true
#
#set :app_server, :passenger
#set :repository,  "https://github.com/rakibquandl/QuandlSearchTool"
#set :scm, :none
#set :deploy_via, :copy
#
#set :checkout, 'export'
#
#set :user, 'username' # Your username goes here
#set :use_sudo, false
#set :domain, 'searchtool.com' # Your domain goes here
#set :applicationdir, "/home/#{user}/#{application}"
#set :deploy_to, applicationdir
#
#role :web, domain
#role :app, domain
#role :db,  domain, :primary => true
#
#
#set :chmod755, "app config db lib public vendor script script/* public/disp*"
#
#namespace :deploy do
#
#  task :start do ; end
#  task :stop do ; end
#  task :restart, :roles => :app, :except => { :no_release => true } do
#    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#  end
#
#end