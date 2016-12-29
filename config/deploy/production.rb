server 'gasjet.ru', user: 'deploy', roles: %w{app db web}
# set :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, 'develop'
set :rails_env, 'production'
