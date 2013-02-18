# encoding: UTF-8

require 'rubygems'
require 'bundler'
Bundler.require

root = File.expand_path File.dirname(__FILE__)
require File.join( root , "./app.rb" )

# everything was moved into a separate module/file to make it easier to set up tests

run Example
