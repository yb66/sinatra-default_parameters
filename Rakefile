require "bundler/gem_tasks"

P = /MODULENAME/

# A module name could come in a variety of shapes and sizes.
# This will help make it the right shape for us.
class ModuleNamer
  def initialize( original )
    @original = original
    # AuthToken Auth-Token Auth_Token auth_token authtoken auth-token
  
    # dir
    @dir_path = File.join original.downcase.split(%r{[/-]})
    @constants = original.split(%r{[/-]|(?:\:\:)}).map{|x| x =~ /\_/ ? x.split(/\_/).map(&:capitalize).join : x.capitalize }.join("::")
  end

  attr_reader :dir_path, :constant_path, :original
end


def edit_in_place( file_name, original_module_name )
  module_name = ModuleName.new original_module_name
  File.open(file_name, 'r+') do |f|   # open file for update
    lines = f.readlines           # read into array of lines
    lines.each do |it|            # modify lines
      if it =~ P
        if it =~ /(?:\/|\-)MODULE/
          it.gsub!(P, module_name.dir_path)
        else
          it.gsub!(P, module_name.constant_path)
        end
        it
      end
    end
    f.pos = 0                     # back to start
    f.print lines.join            # write out modified lines
    f.truncate(f.pos)             # truncate to new length
  end  
end



desc "Rename the files and folders of the project from MODULENAME to something useful."
task :rename do
  new_name = ENV["n"]
  Dir["./**/*"].reject{|f| f["/vendor"] || f["/bin"] || f["Rakefile"] || f["Gemfile"] || f["LICENCE"] || f["README.md"] }.sort_by{|n| n.length }.reverse.each do |file|
    if File.exists?(file)
      File.file?(file) && edit_in_place(file,new_name)
      if file =~ P
        cmd = "git mv #{file} #{file.sub(P,new_name).downcase}"
        warn cmd
        system(cmd)
      end
    end
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