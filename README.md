# Library Directory
[![library_directory](https://travis-ci.org/wvulibraries/library_directory.svg?branch=master)](https://travis-ci.org/wvulibraries/library_directory) [![Maintainability](https://api.codeclimate.com/v1/badges/1eebb5f2bac6fdeae296/maintainability)](https://codeclimate.com/github/wvulibraries/library_directory/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/1eebb5f2bac6fdeae296/test_coverage)](https://codeclimate.com/github/wvulibraries/library_directory/test_coverage)

The library directory rebuild.  Needs to replicate and exceed existing behavior while updating the look and feel of the application.  

## Versions
- Rails 5.2 
- Ruby  2.5.1
- ElasticSearch 6.6.0 
- MySQL 5.7.25 

## Testing and Quality Control 
The test suite includes rspec, capybara, selnium, simplecov, travisCI, and code climate. 
Javascript is difficult to test by iteself.  To run tests locally uncomment the selenium docker container and adjust capybara setups. 
`RAILS_ENV=test bundle exec rspec` this helps to ensure that all gems are loaded appropriately and you do not get the `shoulda error`.  

### Troubleshooting
Weirdness with the test dependencies has been known to occur inside of the docker containers.  Each time a test is run it says that a dependency you know is installed is not available.  What worked for me was removing the environment variable from the docker-compose file. 

# Elastics Search 
Elastic search is responsible for the searching and indexing of the Rails data. Using callbacks the data will be adjusted and indexed everytime an action is made on the dataset.  In the event that you have to reindex again, you may want to use the rake tasks written in the lib folder, not the ones from the default library.  If a model is not enabled it will show up in the search using the default rake tasks associated with the Rails Elastic Search Gems.