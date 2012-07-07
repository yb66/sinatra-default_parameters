# encoding: UTF-8

require "rspec_helper"

require_relative "../lib/sinatra/MODULE.rb"



def new_session( app )
  Rack::Test::Session.new(Rack::MockSession.new( app ) )
end

describe "MODULE" do
  let(:browser){  new_session( app ) }
  before{ browser.get '/' }
  include_context "Any route"
  it_should_behave_like "All pages"
end