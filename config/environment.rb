
# Bundler.require(:default, ENV['SINATRA_ENV'])

# ActiveRecord::Base.establish_connection(ENV['SINATRA_ENV'].to_sym)
require 'bundler/setup'
Bundler.require(:default)
require_all 'app'
set(:database, { adapter: "sqlite3", database: "db/teacherassignments.sqlite3" })