lock '3.6.1'

set :application, 'gasjet'
set :repo_url, 'git@github.com:gafrom/gasjet.git'
# set :pty, true
set :rbenv_ruby, '2.3.1'
set :rbenv_map_bins, %w(rake gem bundle ruby rails eye)

set :ssh_options, forward_agent: true
set :bundle_jobs, 4
set :bundle_env_variables, nokogiri_use_system_libraries: 1

set :eye_roles, -> { :app }
set :deploy_to, -> { '~/gasjet' }

# set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }

append :linked_files, '.env.production'
append :linked_dirs,
       'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets',
       'public/uploads', 'db/backups'

# after 'deploy:started', 'assets:precompile'
# after 'deploy:updated', 'assets:deliver'
