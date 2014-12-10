Gem::Specification.new do |s|
  s.name        = 'tpg'
  s.version     = '0.0.1'
  s.date        = '2014-11-26'
  s.summary     = "TPG"
  s.description = "Transports Publics Genevois"
  s.authors     = ["ghn"]
  s.email       = 'ghugon@gmail.com'
  s.files       = ["lib/tpg.rb"]
  s.homepage    = 'http://rubygems.org/gems/tpg'
  s.license     = 'MIT'
  
  s.add_dependency('rest-client', '1.7.2')
  s.add_dependency('json', '1.8.1')
end