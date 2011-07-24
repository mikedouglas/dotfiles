require 'rake'

task :install do
  files = Dir['_*']

  files.each do |file|
    file =~ /_(.+)/
    target = "#{ENV["HOME"]}/.#{$1}"

    # TODO: allow an option to overwrite file
    `ln -s "$PWD/#{file}" "#{target}"` unless File.exists?(target)
  end
end

task :default => :install
