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
  create_file '.env.sample'

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
  gem 'friendly_id'
  gem 'faker', require: false
  gem 'image_processing'
  gem 'nanoid', require: false
  gem 'vite_rails'
  gem 'turbo-rails'

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
    gem 'overmind'
    gem 'lefthook'
  end

  gem_group :test do
    gem 'cuprite'
    gem 'factory_bot_rails'
  end

  remove_commented_lines 'Gemfile'
end

def add_users
  route "root to: 'home#index'"
end

def copy_files
  copy_file '.rubocop.yml'
  copy_file 'Rakefile'
  copy_file 'lefthook.yml'
  copy_file 'bin/setup'

  directory 'app', force: true
  directory 'lib', force: true
  directory 'spec', force: true
end

def add_friendly_id
  generate 'friendly_id'
end

def set_up_rspec
  generate 'rspec:install'
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

# Main setup

source_paths

create_files
set_up_runtimes
add_gems

after_bundle do
  add_npm_dependencies
  add_users
  add_friendly_id
  set_up_rspec
  set_up_database
  set_up_turbo
  copy_files

  # Migrate
  rails_command 'db:create'
  rails_command 'db:migrate'

  # Git
  copy_file '.gitignore', force: true
  git :init
  git add: '.'
  git commit: %( -m "Initial commit" )
  run 'mkdir -p .git/safe'

  # Initial rubocop setup
  run 'bundle binstubs rubocop'

  # Install lefthook git hooks
  run 'bundle binstubs lefthook'
  run 'bin/lefthook install'

  say
  say 'Kickoff app successfully created! 👍'..., :green
  say

  say '...AND running rubocop auto-correct', :yellow
  say
  run 'bin/rubocop --autocorrect-all --out tmp/rubocop-auto-correct.log'
end
