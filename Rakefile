#!/usr/bin/env rake
require "bundler/gem_tasks"

desc "Run Cukes and Specs"
task :default => ["cukes", "spec"]

task :cukes do
  sh "cucumber"
end

task :spec do
  sh "rspec spec"
end
