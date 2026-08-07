require 'tempfile'

desc 'Bundle the app into a single file and build a native executable'
task :build do
  sources = Dir['lib/**/*.rb'].sort.map { |file| File.read(file) }
  main = File.readlines('main.rb').reject { |line| line.include?('Dir[') || line.start_with?('require') }

  Tempfile.create(['app', '.rb']) do |file|
    file.write((["require 'ruby2d'\n"] + sources + [main.join]).join("\n"))
    file.flush

    abort('build failed') unless system('ruby2d', 'build', file.path)
  end
end
