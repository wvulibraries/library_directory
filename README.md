# Library Directory
[![library_directory](https://travis-ci.org/wvulibraries/library_directory.svg?branch=master)](https://travis-ci.org/wvulibraries/library_directory.svg?branch=master) [![Maintainability](https://api.codeclimate.com/v1/badges/1eebb5f2bac6fdeae296/maintainability)](https://codeclimate.com/github/wvulibraries/library_directory/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/1eebb5f2bac6fdeae296/test_coverage)](https://codeclimate.com/github/wvulibraries/library_directory/test_coverage)

The library directory rebuild.  Needs to replicate and exceed existing behavior while updating the look and feel of the application.  

## Versions
- Rails 5.2 
- Ruby  2.5.1 

## Testing and Quality Control 
The test suite includes rspec, capybara, selnium, simplecov, travisCI, and code climate. 

### Docker Selenium Capybara Problem 
Docker adds some oddities to the normal rails way of doing things and testing.  Since we are using our docker containers to develop the same way it will be deployed in production we have some gotchas.  From the testing aspect we have to attach some items differently and get a working browser in a docker container with a GUI.  To do this we use the senlinium premade docker containers, and set it up to use a remote host.  We will also have to expose another port on our rails app for our test server.  We are just going to expose port 3001.  

```
/docker-compose.yml

 selenium:
    image: selenium/standalone-chrome-debug
    container_name: selenium
    privileged: true
    ports:
      - '4444:4444'
      - '5900:5900'
    environment:
      - SCREEN_WIDTH=1440
      - SCREEN_HEIGHT=900
      - VNC_NO_PASSWORD=true
    logging:
      driver: none
```

```
/spec/support/capybara.rb 
Capybara.run_server = true
Capybara.server_host = '0.0.0.0'
Capybara.server_port = 3001

Capybara.register_driver :remote_browser do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w[headless disable-gpu no-sandbox] }
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: 'http://selenium:4444/wd/hub',
    desired_capabilities: capabilities
  )
end

Capybara.javascript_driver = :remote_browser

RSpec.configure do |config|
  config.before(:each) do
    Capybara.app_host = 'http://rails:3001'
  end

  config.after(:each) do
    Capybara.reset_sessions!
    Capybara.use_default_driver
    Capybara.app_host = nil
  end
end
```

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


## Missing Employees
- Lynne Stahl


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



# Elastics Search 
Elastic search is responsible for the searching and indexing of the Rails data. Using callbacks the data will be adjusted and indexed everytime an action is made on the dataset.  In the event that you have to reindex again, you may want to use the rake tasks written in the lib folder, not the ones from the default library.  If a model is not enabled it will show up in the search using the default rake tasks associated with the Rails Elastic Search Gems.  

## Rake Tasks

```
rake search_index:all                              # Re-index all environments
rake search_index:building                         # Properly Index Buildings
rake search_index:department                       # Properly Index Departments
rake search_index:employee                         # Properly Index Employees
```