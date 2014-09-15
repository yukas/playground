task :default => :say_it

task :hello do
  puts "Hello"
end

task :world do
  puts "World"
end

task :say_it => [:hello, :world] do
  puts "...has been said"
end

task :foo do
  Rake::Task['hello'].invoke
end