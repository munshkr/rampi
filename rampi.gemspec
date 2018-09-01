lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rampi/version"

Gem::Specification.new do |spec|
  spec.name          = "rampi"
  spec.version       = Rampi::VERSION
  spec.authors       = ["Damián Silvani"]
  spec.email         = ["munshkr@gmail.com"]

  spec.summary       = %q{REPL for Rampcode, a bytebeat interpreter for Puredata}
  spec.homepage      = "https://github.com/munshkr/rampi"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["rampi"]
  spec.require_paths = ["lib"]

  spec.add_dependency "pry"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
