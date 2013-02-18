require 'sinatra/base'
require 'sinatra/default_parameters'

# modular app
class Example < Sinatra::Base
  helpers Sinatra::DefaultParameters

  get "/" do
    set_defaults start: 10, finish: 20
    # This will force the order
    # It's easier to compare/test the output then
    Hash[ params.sort ].inspect
  end

end

