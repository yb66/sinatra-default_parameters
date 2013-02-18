# encoding: UTF-8

require 'sinatra/base'

module Sinatra

  # Extends the request context with a helper to give a quick and simple way to set defaults for the params helper on a per route basis.
  # @author Iain Barnett
  module DefaultParameters

    # A helper to set default keys/values on the params helper hash.
    # @note As you can see from the examples it doesn't do any type casting or other checks, it just does this one very small thing, the rest is up to you.
    # @params [Hash] defaults A list of the defaults.
    # @example
    #   get "/comments/?" do
    #     set_defaults start: 10, finish: 20
    #     params.inspect
    #   end
    #   # GET http://localhost:9292/comments
    #   # => {"start"=>10, "finish"=>20}
    #   # GET http://localhost:9292/comments?start=5&units=seconds
    #   # => {"start"=>"5", "units"=>"seconds", "finish"=>20}
    # @return [Hash] It returns the params hash, but since you've got access to that helper in the request scope it doesn't matter.
    def set_defaults( defaults={} )
      # stringify the keys!
      h = defaults.each_with_object({}) do |(k,v),h|
        h[k.to_s] = defaults[k]
      end
      # `merge` into `h` first to preserve the `params` already set.
      # Then `merge!` that into params to set it.
      params.merge!( h.merge params )
    end

  end
  helpers DefaultParameters
end
