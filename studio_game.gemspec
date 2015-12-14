Gem::Specification.new do |s|
  s.name         = "StudioGame"
  s.version      = "1.0.0"
  s.author       = "Mike Huighes"
  s.email        = "mike.robert.hughes@gmail.com"
  s.homepage     = "www.mrhughes.info"
  s.summary      = "A game that plays itself"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end
