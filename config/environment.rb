require 'bundler/setup'
Bundler.require
require_all 'app'
require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'

connection = ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/recipe_domain.sqlite"
)
