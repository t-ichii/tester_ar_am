require 'active_record'
require 'active_model'
require 'yaml'
require 'erb'
require 'logger'

Pry.config.color = true

dbconfig = ::YAML.load(ERB.new(File.read('config/database.yml')).result)['default']
ActiveRecord::Base.establish_connection(dbconfig)
ActiveRecord::Base.logger = Logger.new(STDOUT)

def reload!
  Dir.glob('models/*').map {|file_path|
    load file_path
  }
end

reload!
