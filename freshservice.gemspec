# frozen_string_literal: true

require_relative "lib/freshservice/version"

Gem::Specification.new do |spec|
  spec.name = "freshservice"
  spec.version = Freshservice::VERSION
  spec.authors = ["Lien Van Den Steen"]
  spec.email = ["lienvandensteen@gmail.com"]

  spec.summary = "Ruby Gem for the Freshservice v2 API."
  spec.description = "Ruby Gem for the Freshservice v2 API."
  spec.homepage = "https://github.com/lienvdsteen/freshservice/blob/main/CHANGELOG.md"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/lienvdsteen/freshservice/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "json"
  spec.add_runtime_dependency "rest-client", "~> 2.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
