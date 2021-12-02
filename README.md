# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin19]
* System dependencies
Rails version: 6.1.4.1

* Configuration

* Database creation
```
bin/rails db:create
Running via Spring preloader in process 39067
Created database 'canada_gun_dir_development'
Created database 'canada_gun_dir_test'
```
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## roadmap
DB relations
* user -> 
    - reddit username or discord username (cannot both be null)
    - club(S) (array for now)
    - license (bool)
    - type of gun(s) (string for now)
    - province (string)
    - city/region (string)
    - note (text)

- make a simple UI
	- dropdown selections
    - export to PDF using react pkgs
- populate with real data
    - don't commit user info to this repo
    - write a script to read the excel entries and send them to the heroku db
