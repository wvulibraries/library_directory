RSpec.configure do |config|
  config.before(:each) do
    Employee.__elasticsearch__.delete_index! if Employee.__elasticsearch__.index_exists?
    Building.__elasticsearch__.delete_index! if Employee.__elasticsearch__.index_exists?
    Department.__elasticsearch__.delete_index! if Employee.__elasticsearch__.index_exists?
  end

  config.after(:each) do
    Employee.__elasticsearch__.delete_index! if Employee.__elasticsearch__.index_exists?
    Building.__elasticsearch__.delete_index! if Employee.__elasticsearch__.index_exists?
    Department.__elasticsearch__.delete_index! if Employee.__elasticsearch__.index_exists?
  end
end
