# encoding: UTF-8
require 'rake'

task :install do
  files = Dir['*/**.symlink']

  files.each do |file|
    file =~ /\/(.+)\.symlink/
    target = "#{ENV["HOME"]}/.#{$1}"

    # TODO: allow an option to overwrite file
    unless File.exists? target
      `ln -s "$PWD/#{file}" "#{target}"`
      puts "#{file} → #{target}"
    end
  end
end

task :default => :install
