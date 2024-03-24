require_relative "lib/cash_register/version"

Gem::Specification.new do |spec|
  spec.name        = "cash_register"
  spec.version     = CashRegister::VERSION
  spec.authors     = ["Nacho Abad"]

  spec.summary     = %q{A simple cash register CLI}
  spec.description = %q{A Ruby CLI application to add products and discounts to an order}
  spec.license     = "MIT"

  spec.files = Dir["lib/**/*.rb", "bin/*", "LICENSE.txt", "README.md"]
  spec.bindir = "bin"
  spec.executables << "cash_register"

  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec"
end

