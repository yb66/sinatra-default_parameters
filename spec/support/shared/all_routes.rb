# encoding: UTF-8

require 'sinatra/base'
require_relative "../../../lib/sinatra/MODULE.rb"
# require_relative "./helpers.rb"

class Example < Sinatra::Base
  register Sinatra::MODULE
  
  # some routes here...
end

shared_context "All pages" do
  include Rack::Test::Methods
  let(:app){ Example }
  #include MODULE::RSpec::Helpers
end

shared_examples_for "Any route" do
  subject { last_response }
  it { should be_ok }
end