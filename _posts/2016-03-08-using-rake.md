---
tags: ruby, rake
---

* Dependancies are in Hash syntax
* Dependancies run only once.
    * So if a, b depend on c and a task d has both a, b as dependancy, running task d wouldn't run c twice.
* Also, tasks are not functions

```ruby
task :default => :mm
# do
#   puts "running default"
# end

task :mm => [:oo, :nn] do
  puts "mm working"
end

task :nn do
  puts "nn working"
end

task :oo => [:nn] do
  puts "oo working"
end
```

* Namespaced tasks make it easier to have tasks with same names
task

```ruby
:go_to_store do
  puts "Going to store"
end

# To call this use `rake apple:go_to_store`:

namespace :apple do
  task :go_to_store do
    puts "Going to Apple Store"
  end
end
```

* Adding task description:

```ruby
desc "Some task description"
task :named_task do
  puts "Named task"
end
```
