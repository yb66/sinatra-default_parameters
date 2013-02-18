# Sinatra Default Parameters #

## What? ##

A quick and simple way to set defaults for the params helper on a per route basis.

## Why? ##

I was inspired to make this into a gem after [answering this question on StackOverflow](http://stackoverflow.com/a/14885171/335847). I liked the look of it and thought I'll use this again, hence a gem.

## How? ##

It's quite simple.

    require 'sinatra/default_parameters'
    
    helpers Sinatra::DefaultParameters # This too if you're using modular style apps.
    
    get "/" do
      set_defaults a: 1, b: 2, c: 3
      params.inspect
    end
    
    # GET "/"
    # => {"a"=>1, "b"=>2, "c"=>3}
    # GET "/?a=7&b=4"
    # => {"a"=>"7", "b"=>"4", "c"=>3}
    # GET "/?d=4"
    # => {"a"=>1, "b"=>2, "c"=>3, "d"=>"4"}
    # GET "/?a=7&b=4&d=4"
    # => {"a"=>"7", "b"=>"4", "c"=>3, "d"=>"4"}

Simples, innit.

***Note:*** As you can see from the examples it doesn't do any type casting or other checks, it just does this one very small thing, the rest is up to you.


## Licence ##

See the LICENCE file.
