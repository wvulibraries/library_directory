require "paperclip/matchers"

RSpec.configure do |config|
  # config expectations
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # config mocks
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # alternative configs
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.default_formatter = 'doc'
  config.order = :random

  # paper clip 
  config.include Paperclip::Shoulda::Matchers
end