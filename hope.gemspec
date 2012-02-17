# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hope/version', __FILE__)

Gem::Specification.new do |s|
  s.name            = 'hope'
  s.version         = Hope::VERSION.dup
  s.summary         = %q{jruby wrapper for Esper (Stream Event Processing)}
  s.description     = %q{jruby wrapper for Esper (Stream Event Processing) }
  s.homepage        = 'https://github.com/sbellity/hope'
  s.authors         = ['Stephane Bellity']
  s.email           = ['sbellity@gmail.com']
  
  s.files           = Dir.glob('{bin,lib}/**/*') + %w(Gemfile hope.gemspec)
  
  s.platform        = 'java'
  s.require_paths   = ['lib']

  s.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')

  s.add_runtime_dependency      'json-jruby',     '~> 1.4'
  s.add_runtime_dependency      'em-zeromq',      '~> 0.2.1'
  
  s.add_development_dependency  'rake',           '~> 0.9.2'
  s.add_development_dependency  'rspec',          '~> 2.8'
end
