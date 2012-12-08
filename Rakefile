#!/usr/bin/env rake
require "bundler/gem_tasks"

Bundler.setup
require 'rspec/core/rake_task'

task default: [:spec]
desc "run spec"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ["-c"]
end
