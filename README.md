# Library Directory
[![library_directory](https://travis-ci.org/wvulibraries/library_directory.svg?branch=master)](https://travis-ci.org/wvulibraries/library_directory) [![Maintainability](https://api.codeclimate.com/v1/badges/1eebb5f2bac6fdeae296/maintainability)](https://codeclimate.com/github/wvulibraries/library_directory/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/1eebb5f2bac6fdeae296/test_coverage)](https://codeclimate.com/github/wvulibraries/library_directory/test_coverage)

The library directory rebuild.  Needs to replicate and exceed existing behavior while updating the look and feel of the application.  

## Versions
- Rails 5.2 
- Ruby  2.5.1 

## Testing and Quality Control 
The test suite includes rspec, capybara, selnium, simplecov, travisCI, and code climate. To run the tests type the following `xvfb-run bundle exec rspec`.  

## PRY FOR DEBUGGING 
[Pry for Rails Gist](https://gist.github.com/ddavisgraphics/d1a7a1c52aeadbc2b8305ac0298ae9ab) 
Pay attention to the attaching part you should also be able to attach by name. 

## Missing Employees
- Lynne Stahl

# Elastics Search 
Elastic search is responsible for the searching and indexing of the Rails data. Using callbacks the data will be adjusted and indexed everytime an action is made on the dataset.  In the event that you have to reindex again, you may want to use the rake tasks written in the lib folder, not the ones from the default library.  If a model is not enabled it will show up in the search using the default rake tasks associated with the Rails Elastic Search Gems.  

## Rake Tasks

```
rake search_index:all                              # Re-index all environments
rake search_index:building                         # Properly Index Buildings
rake search_index:department                       # Properly Index Departments
rake search_index:employee                         # Properly Index Employees
```

