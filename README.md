# Library Directory

The library directory rebuild.  Needs to replicate and exceed existing behavior while updating the look and feel of the application.  

## Versions
- Rails 5.2 
- Ruby  2.5.1 

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
