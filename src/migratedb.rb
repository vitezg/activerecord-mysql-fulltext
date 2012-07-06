
# simple script to migrate the database

require "dbconnect"
puts "Current version:", ActiveRecord::Migrator.current_version
ActiveRecord::Migration.verbose = true
ActiveRecord::Migrator.migrate "migrations/", ARGV[0] ? ARGV[0].to_i : nil
