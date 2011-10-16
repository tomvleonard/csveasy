# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "csveasy/version"

Gem::Specification.new do |s|
  s.name        = "csveasy"
  s.version     = Csveasy::VERSION
  s.authors     = ["Tom Leonard"]
  s.email       = ["tvleonard@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A simple, easy-to-use CSV read/write tool.}
  s.description = %q{Read a CSV file into a hash collection. Write a hash or an array collection to a CSV file. Bing bam boom.}

  s.rubyforge_project = "csveasy"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_development_dependency 'mocha', '>= 0.9.8'
end
