# frozen_string_literal: true

require_relative "lib/obsidian_api/version"

Gem::Specification.new do |spec|
  spec.name          = "obsidian_api"
  spec.version       = ObsidianApi::VERSION
  spec.authors       = ["Michael O'Boyle"]
  spec.email         = ["michael@oboyle.co"]

  spec.summary       = "A Ruby gem for interacting with Obsidian vaults."
  spec.description = "ObsidianAPI Gem provides an interface for managing Markdown files, metadata, and events"\
    "within an Obsidian vault. Ideal for developers looking to automate tasks or integrate Obsidian " \
    "with Ruby applications."
  spec.homepage      = "https://github.com/michaeloboyle/obsidian_api"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"]      = spec.homepage
  spec.metadata["source_code_uri"]   = "https://github.com/michaeloboyle/obsidian_api"
  spec.metadata["changelog_uri"]     = "https://raw.githubusercontent.com/michaeloboyle/obsidian_api/main/CHANGELOG.md"

  spec.files         = Dir["{lib,spec}/**/*", "README.md", "LICENSE.txt"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # If you have any specific dependencies, add them here:
  # spec.add_dependency "rspec", "~> 3.10"  # for testing
end
