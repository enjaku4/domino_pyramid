require 'ruby2d'

Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each { |f| load(f) }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = :documentation
  end
end
