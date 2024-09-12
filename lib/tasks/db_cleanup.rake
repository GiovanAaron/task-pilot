namespace :db do
    desc "Drop and recreate tables before seeding"
    task cleanup_and_seed: :environment do
      # Get the list of tables
      tables = ActiveRecord::Base.connection.tables
  
      # Drop foreign key constraints first to avoid dependency issues
      tables.each do |table|
        next if table == 'schema_migrations' # Skip the schema migrations table
        ActiveRecord::Base.connection.execute("ALTER TABLE #{table} DROP CONSTRAINT IF EXISTS #{table}_fk;") rescue nil
      end
  
      # Drop tables with CASCADE to remove dependent objects
      tables.each do |table|
        next if table == 'schema_migrations' # Skip the schema migrations table
        ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS #{table} CASCADE;")
      end
  
      # Run migrations
      Rake::Task['db:migrate'].invoke
  
      # Seed the database
      Rake::Task['db:seed'].invoke
    end
  end
  