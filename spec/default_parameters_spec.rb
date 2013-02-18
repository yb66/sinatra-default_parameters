# encoding: UTF-8

require "spec_helper"

require_relative "../lib/sinatra/default_parameters.rb"


describe "DefaultParameters" do

  before do
    get '/'
  end

  # check the app works ok
  include_context "All pages"
  it_should_behave_like "Any route"

  describe "The output" do
    subject { last_response.body }
    context "Given no parameters via the request" do
      let(:expected) { %q!{"finish"=>20, "start"=>10}! }
      it { should == expected }
    end
    context "Given extra parameters via the request" do
      before do
        get '/?unit=seconds&type=race'
      end
      let(:expected) { 
        %q!{"finish"=>20, "start"=>10, "type"=>"race", "unit"=>"seconds"}!
      }
      it { should == expected }
    end
    
    context "Given parameters that have keys the same as the defaults" do
      before do
        get '/?start=5'
      end
      let(:expected) { %q!{"finish"=>20, "start"=>"5"}! }
      it { should == expected }
      context "Given extra parameters too" do
        before do
          get '/?unit=seconds&type=race&start=5'
        end
        let(:expected) { 
          %q!{"finish"=>20, "start"=>"5", "type"=>"race", "unit"=>"seconds"}!
        }
        it { should == expected }
      end
    end
  end
end