# Library Directory
[![library_directory](https://travis-ci.org/wvulibraries/library_directory.svg?branch=master)](https://travis-ci.org/wvulibraries/library_directory.svg?branch=master) [![Maintainability](https://api.codeclimate.com/v1/badges/1eebb5f2bac6fdeae296/maintainability)](https://codeclimate.com/github/wvulibraries/library_directory/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/1eebb5f2bac6fdeae296/test_coverage)](https://codeclimate.com/github/wvulibraries/library_directory/test_coverage)

The library directory rebuild.  Needs to replicate and exceed existing behavior while updating the look and feel of the application.  

## Versions
- Rails 5.2 
- Ruby  2.5.1 

## Testing and Quality Control 
The test suite includes rspec, simplecov, travisCI, and code climate.  These tools are to make sure there is no odd code and the code is tested at 100%.  Quality assurance should also consist of RuboCop to ensure style of syntax is followed.  

- `RAILS_ENV=test bundle exec rspec` for testing in docker container. 

## Data Modeling 
![data models](https://github.com/wvulibraries/library_directory/blob/master/research/data_models.jpg?raw=true)

## Features
- Full text search via [Elasticsearch](https://www.elastic.co/products/elasticsearch) and the [Searchkick](https://github.com/ankane/searchkick) gem

## Potential Addons 
- Autocompletion [corejs-typeahead](https://github.com/corejavascript/typeahead.js)
- Background jobs with [ActiveJob](https://github.com/rails/rails/tree/master/activejob) and the [Sidekiq](http://sidekiq.org/) gem
- Cron [Sidekiq-Cron](https://github.com/ondrejbartas/sidekiq-cron) || [Whenever](https://github.com/javan/whenever)


## PRY FOR DEBUGGING 
[Pry for Rails Gist](https://gist.github.com/ddavisgraphics/d1a7a1c52aeadbc2b8305ac0298ae9ab) 
Pay attention to the attaching part you should also be able to attach by name. 

---- 


# TODO BEFORE PRODUCTION 

## CRSF Protection 
In `controllers/application_controller.rb` there is a line to protect from CRSF attacks.  To test this is working we will need to do the following.  

- The authenticity token is part of the form data: edit page to alter / remove these and form submission should result in an exception. Ajax submitted forms can also csrf meta tags in the head portion of the page - you may wish to alter these to.
- Create a standalone html page (outside of your app) which contains a form posting to the action you want to test
- The authenticity token is stored in the session, so after the form has been displayed hit a url in another browser tab / session that calls reset_session. Now submit the form - it should fail.

# ADD TO README 

Things you may want to cover:
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ... 
