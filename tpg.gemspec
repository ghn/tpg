Gem::Specification.new do |s|
  s.name        = 'tpg'
  s.version     = '0.0.2'
  s.date        = '2014-11-26'
  s.summary     = 'TPG'
  s.description = 'Transports Publics Genevois'
  s.authors     = ['ghn']
  s.email       = 'germain@ghmail.ch'
  s.files       = ['lib/tpg.rb']
  s.homepage    = 'http://rubygems.org/gems/tpg'
  s.license     = 'MIT'

  s.add_dependency('rest-client', '2.0.2')
  s.add_dependency('json', '2.1.0')
end
