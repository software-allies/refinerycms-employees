# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.author            = 'preth00nker'
  s.name              = 'refinerycms-employees'
  s.version           = '1.0.1'
  s.description       = 'Ruby on Rails Employees extension for Refinery CMS'
  s.date              = '2014-07-28'
  s.summary           = 'Employees extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.1.2'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.1.2'
end