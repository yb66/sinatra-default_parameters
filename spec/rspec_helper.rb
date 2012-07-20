# encoding: UTF-8

require 'rspec'
require "rack/test"

# code coverage
require 'simplecov'
SimpleCov.start do
  add_filter "/vendor/"
  add_filter "/bin/"
end

ENV['RACK_ENV'] ||= 'test'
ENV["EXPECT_WITH"] ||= "racktest"


Spec_dir = File.expand_path( File.dirname __FILE__ )


require "logger"
logger = Logger.new STDOUT
logger.level = Logger::DEBUG
logger.datetime_format = '%a %d-%m-%Y %H%M '
LOgger = logger



Dir[ File.join( Spec_dir, "/support/**/*.rb")].each do |f| 
  logger.info "requiring #{f}"
  require f
end


RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true  
end
