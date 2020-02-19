
Gem::Specification.new do |spec|
  spec.name          = "embulk-filter-expand_csv_array"
  spec.version       = "0.1.3"
  spec.authors       = ["SNakano", "Naoki AINOYA"]
  spec.summary       = "Expand CSV Array filter plugin for Embulk"
  spec.description   = "Expand CSV Array"
  spec.email         = ["s.nakano@guppy.co.jp", "ainonic@gmail.com"]
  spec.licenses      = ["MIT"]
  spec.homepage      = "https://github.com/SNakano/embulk-filter-expand_csv_array"

  spec.files         = `git ls-files`.split("\n") + Dir["classpath/*.jar"]
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'embulk', ['~> 0.8.13']
  spec.add_development_dependency 'bundler', ['~> 1.10.6']
  spec.add_development_dependency 'rake', ['~> 10.0']
end
