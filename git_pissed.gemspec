# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git_pissed/version'

Gem::Specification.new do |spec|
  spec.name          = 'git_pissed'
  spec.version       = GitPissed::VERSION
  spec.authors       = ['Chris Hunt']
  spec.email         = ['c@chrishunt.co']
  spec.description   = %q{gitting pissed about your code}
  spec.summary       = %q{gitting pissed about your code}
  spec.homepage      = 'https://github.com/chrishunt/git-pissed'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'ruby-progressbar', '~> 1.7.5'

  spec.add_development_dependency 'bundler', '~> 1.10.0'
  spec.add_development_dependency 'rake',    '~> 10.4.2'
end
