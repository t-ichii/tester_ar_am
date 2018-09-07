# Ref: https://qiita.com/foloinfo/items/6ecfe3c5fd1b56f1dceb

require 'active_record'
require 'yaml'
require 'erb'
require 'logger'

namespace :db do
  desc "Migrate database"
  task :migrate => :environment do
    am = ActiveRecord::MigrationContext.new('db/migrate/')
    am.rollback
    am.migrate
  end
  
  desc "Create database"
  task :create => :environment do
    conn_config = ActiveRecord::Base.connection_config
    ActiveRecord::Base.establish_connection(conn_config.merge(database: nil))
    ActiveRecord::Base.connection.create_database(conn_config[:database])
  end

  desc "Drop database"
  task :drop => :environment do
    conn_config = ActiveRecord::Base.connection_config
    ActiveRecord::Base.establish_connection(conn_config.merge(database: nil))
    ActiveRecord::Base.connection.drop_database(conn_config[:database])
  end

  task :environment do
    dbconfig = ::YAML.load(ERB.new(File.read('config/database.yml')).result)['default']
    ActiveRecord::Base.establish_connection(dbconfig)
    ActiveRecord::Base.logger = Logger.new('db/database.log')
  end 
end

