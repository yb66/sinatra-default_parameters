# encoding: UTF-8

require 'sinatra/base'
require_relative "../../../lib/sinatra/default_parameters.rb"
# require_relative "./helpers.rb"

require_relative "../../../examples/app.rb"

shared_context "All pages" do
  include Rack::Test::Methods
  let(:app){ Example }
  #include MODULE::RSpec::Helpers
end

shared_examples_for "Any route" do
  subject { last_response }
  it { should be_ok }
end