# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cucumba/version"

Gem::Specification.new do |s|
  s.name        = "cucumba"
  s.version     = Cucumba::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["kucaahbe"]
  s.email       = ["kucaahbe@ukr.net"]
  s.homepage    = "http://rubygems.org/gems/cucumba"
  s.summary     = %q{If you develop more than one rails applications that communicate with each other and you need to test them with something like capybara and also whant to communicate with database - this gem will help you}
  s.description = s.summary
  s.homepage    = %q{http://github.com/hxcoding/cucumba}
  s.post_install_message = %q{PostInstall.txt}


  s.rubyforge_project = "cucumba"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
