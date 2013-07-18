$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ortsbo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ortsbo"
  s.version     = Ortsbo::VERSION
  s.authors     = ["Chris Constantin, Aaron Webster"]
  s.email       = ["aaronw@tictalking.com"]
  s.homepage    = "https://github.com/tictalking/ortsbo"
  s.summary     = "A library to access the Ortsbo Translation API"
  s.description = ""

  s.files = Dir["{app,config,db,lib,data}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "json"
  s.add_dependency "nokogiri"
  s.add_dependency "httparty"
end
