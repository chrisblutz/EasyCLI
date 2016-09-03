require 'rake'

Gem::Specification.new do |s|
  s.name = 'easy_cli'
  s.version = '0.1.0'
  s.date = '2016-09-02'
  s.summary = 'A basic command-line parser'
  s.authors = ['Christopher Lutz']
  s.email = 'lutzblox@gmail.com'
  s.files = FileList['lib  .rb',
                     '[A-Z]*',
                     'test/ *'].to_a
  s.license = 'MIT'

  s.required_ruby_version = '>= 2.0.0'
end
