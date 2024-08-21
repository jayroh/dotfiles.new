# frozen_string_literal: true

# Template Name: Jayroh Kickofftemplate
# Author: Joel Oliveira
# Author URI: https://joeloliveira.com
# Instructions: $ rails new myapp -m ~/.dotfiles/tag-ruby/rails_template/template.rb

RUBY_VERSION = '3.3.4'
NODE_VERSION = '22.5.1'

def source_paths
  [__dir__]
end

def remove_commented_lines(file)
  file_content = File.readlines(file)
  filtered_content = file_content.reject { |line| line.match?(/^\s*#/) }

  File.open(file, 'w') do |file|
    file.puts filtered_content
  end
end

def set_up_runtimes
  gsub_file 'Gemfile', /^ruby ".*"$/, "ruby file: '.tool-versions'"
  run 'asdf plugin update ruby'
  run 'asdf plugin update nodejs'
  run 'asdf install'
end

def create_files
  create_file '.tool-versions', <<~TOOL_VERSIONS
    ruby #{RUBY_VERSION}
    nodejs #{NODE_VERSION}
  TOOL_VERSIONS

  create_file 'Procfile', <<~PROCFILE
    vite: bin/vite dev
    web: bin/rails s -b 0.0.0.0
    rubocop: bin/rubocop --start-server --no-detach
  PROCFILE
end

def add_gems
  gem 'faker', require: false
  gem 'friendly_id'
  gem 'good_job'
  gem 'image_processing'
  gem 'nanoid', require: false
  gem 'redis'
  gem 'turbo-rails'
  gem 'vite_rails'

  gem_group :development, :test do
    gem 'dotenv'
    gem 'rspec-rails'
    gem 'rubocop', require: false
    gem 'rubocop-capybara', require: false
    gem 'rubocop-factory_bot', require: false
    gem 'rubocop-performance', require: false
    gem 'rubocop-rails', require: false
    gem 'rubocop-rspec', require: false
    gem 'rubocop-rspec_rails', require: false
  end

  gem_group :development do
    gem 'i18n-tasks'
    gem 'overmind'
    gem 'lefthook'
  end

  gem_group :test do
    gem 'cuprite'
    gem 'factory_bot_rails'
  end

  remove_commented_lines 'Gemfile'
end

def copy_files
  copy_file 'Procfile.dev', force: true
  copy_file 'Procfile.production', force: true
  copy_file '.rubocop.yml', force: true
  copy_file 'Rakefile', force: true
  copy_file 'lefthook.yml', force: true
  copy_file 'bin/setup', force: true
  copy_file '.env.sample', force: true

  directory 'app', force: true
  directory 'lib', force: true
  directory 'spec', force: true
  directory 'config', force: true
end

def install_binstubs
  binstubs = %w[
    good_job
    lefthook
    overmind
    rspec-core
    rubocop
  ]
  run "bundle binstubs #{binstubs.join(' ')}"
end

def run_generators
  generate 'friendly_id'
  generate 'rspec:install'
  generate 'good_job:install'
end

def add_npm_dependencies
  run 'npm i -D @hotwired/turbo autoprefixer postcss tailwindcss vite vite-plugin-ruby'
  run 'npm i @hotwired/stimulus shubox stimulus-vite-helpers'
  run 'bundle exec vite install'

  copy_file 'postcss.config.js'
  copy_file 'tailwind.config.js'
end

def set_up_database
  generate 'migration enable_uuid_extension'
  generator_file = Dir['db/migrate/*_enable_uuid_extension.rb'].first
  append_to_file generator_file, "\nenable_extension 'pgcrypto'", after: 'def change'
  remove_commented_lines 'config/database.yml'
end

def set_up_turbo
  rails_command 'turbo:install'
end

def update_app_config
  insert_into_file 'config/application.rb', after: /.*config.load_defaults.*$/ do
    <<~APP_CONFIG
      \n
      config.generators do |g|
        g.factory_bot dir: 'spec/factories'
        g.helper false
        g.orm :active_record, primary_key_type: :uuid
        g.request_specs false
        g.routing_specs false
        g.test_framework :rspec
        g.view_specs false
      end

      config.active_job.queue_adapter = :good_job
    APP_CONFIG
  end
end

def update_routes
  route "root to: 'home#index'"
  route "mount GoodJob::Engine => 'good_job'"
end

# Main setup

source_paths
create_files
set_up_runtimes
add_gems

after_bundle do
  say '⚡Adding npm dependencies ...', :yellow
  add_npm_dependencies

  say '⚡Running generators ...', :yellow
  run_generators

  say '⚡Setting up database ...', :yellow
  set_up_database

  say '⚡Setting up turbo ...', :yellow
  set_up_turbo

  say '⚡Copying over files ...', :yellow
  copy_files

  say '⚡Installing binstubs ...', :yellow
  install_binstubs

  say '⚡Updating app config file ...', :yellow
  update_app_config

  say '⚡Updating routes ...', :yellow
  update_routes

  # Migrate
  say '⚡Migrating database...', :yellow
  rails_command 'db:create'
  rails_command 'db:migrate'

  # Install lefthook git hooks
  say '⚡Installing lefthook git hooks...', :yellow
  run 'bin/lefthook install'

  # Rubocop all the things
  say '⚡Running rubocop ...', :yellow
  rails_command 'rubocop', abort_on_failure: false

  # Git
  say '⚡Initializing git...', :yellow
  copy_file '.gitignore', force: true
  git :init
  git add: '.'
  git commit: %( -m "Initial commit" )
  run 'mkdir -p .git/safe'

  say
  say 'Kickoff app successfully created! 👍'..., :green
end
