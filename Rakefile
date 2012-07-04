#!/usr/bin/env rake
require "bundler/gem_tasks"

task :rename do
  Dir.glob("./**/*").each do |file|
    File.rename(file, file.downcase) #or upcase if you want to convert to uppercase
  end
end

desc "(Re-) generate documentation and place it in the docs/ dir."
task :docs => :"docs:yard"  
namespace :docs do
  require 'yard'
  YARD::Rake::YardocTask.new do |t|
    t.files   = ['lib/**/*.rb']
    t.options = ['-odocs/', '--no-private']
  end

  desc "Docs including private methods."
  YARD::Rake::YardocTask.new(:all) do |t|
    t.files   = ['lib/**/*.rb']
    t.options = ['-odocs/']
  end
    
  desc "How to use the docs."
  task :usage do
    puts "Open the index.html file in the docs directory to read them. Does not include methods marked private unless you ran the 'all' version (you'll only need these if you plan to hack on the library itself)."
  end
end