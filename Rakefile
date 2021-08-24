# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task :default do
  puts 'Hello world!'
end

desc 'Set timezone'
task set_timezone: :environment do
  ENV['TZ'] = 'UTC'
end

desc 'Show time'
task current_time: :set_timezone do
  puts "Time now: #{Time.zone.now}"
end

desc 'Create new directory with file'
namespace :work_with_files do
  task create_directory: :environment do
    mkdir_p('new directory')
    cd('new directory')
    touch('some file')
  end
end

desc 'Show path to ruby'
task ruby_path: :environment do
  puts (ENV['RUBY_VERSION']).to_s
end
