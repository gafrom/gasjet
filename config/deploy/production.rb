server '194.58.92.29', user: 'betty', roles: %w{app db web}
# set :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, 'develop'
set :rails_env, 'production'
