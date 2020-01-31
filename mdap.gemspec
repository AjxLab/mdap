require_relative 'lib/mdap/version'

Gem::Specification.new do |spec|
  spec.name          = "mdap"
  spec.version       = Mdap::VERSION
  spec.authors       = ["Tatsuya Abe"]
  spec.email         = ["abe12@mccc.jp"]

  spec.summary       = %q{A displaying progress utility for Ruby.}
  spec.description   = %q{This utility can display the progress bar of the process.}
  spec.homepage      = "https://github.com/AjxLab/mdap"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/AjxLab/mdap"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
