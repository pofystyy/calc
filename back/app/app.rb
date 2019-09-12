Dir["#{File.dirname(__FILE__)}/controllers/concerns/**/*.rb"].each { |file| require file }
Dir["#{File.dirname(__FILE__)}/services/**/*.rb"].each { |file| require file }

require 'sinatra'
require 'json'
