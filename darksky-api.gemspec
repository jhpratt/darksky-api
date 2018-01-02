lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'darksky-api/version'

Gem::Specification.new do |spec|
  spec.name          = 'darksky-api'
  spec.version       = DarkSky::VERSION
  spec.authors       = ['Jacob Pratt']
  spec.email         = ['the.z.cuber@gmail.com']

  spec.summary       = 'Library for the public API on DarkSky.net'
  spec.homepage      = 'https://github.com/jhpratt/darksky-api'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'json', '~> 2.1'
  spec.add_dependency 'rest-client', '~> 2.0'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.52'
  spec.add_development_dependency 'simplecov', '~> 0.15'
end
