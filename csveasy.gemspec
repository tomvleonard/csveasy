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
  s.description = %q{Read a CSV file into an array of hashes. Write an array of arrays/hashes to a CSV file.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
