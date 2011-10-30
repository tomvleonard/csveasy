# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "csveasy/version"

Gem::Specification.new do |s|
  s.name        = "csveasy"
  s.version     = Csveasy::VERSION
  s.authors     = ["Tom Leonard"]
  s.email       = ["tvleonard@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A simple CSV read/write gem.}
  s.description = %q{Read or write a CSV file in one line }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
