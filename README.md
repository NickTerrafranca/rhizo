# README

# Rails 6 Boilerplate Application
### Minimal Rails 6 application to allow for fast forking and creation of new rails projects

* Ruby version 2.6.2

* Rails 6.0.1

* Minitest 5.13

# Install rvm
`https://rvm.io/rvm/install`

# Install Ruby version
* `$ rvm install 2.6.2`
* `$ rvm use 2.6.2`
* # Set default ruby version
* $ rvm --default use 2.6.2
* # use system version
* $ rvm use system

### Install npm
$ npm install latest-version

### Install yarn
$ brew install yarn
$ yarn install --check-files

### Install PostgreSQL
* postgres --version # This should not return a version number. If it does you need to update/remove/migrate the old installation
* brew update
* brew install postgresql
* brew services start postgresql


### Setup database
$ gem install pg
# Add pg gem in gemfile
$ brew services start postgresql
$ createdb `<app_name>_development` # set by rials new <app_name> in config/database.yml

### Setup guard gem
$ bundle exec guard init
# Open an new terminal tab and start guard watcher
$ bundle exec guard
