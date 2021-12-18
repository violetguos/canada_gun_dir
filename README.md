# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version
  ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin19]
- System dependencies
  Rails version: 6.1.4.1

- Configuration

- Database creation

```
bin/rails db:create
Running via Spring preloader in process 39067
Created database 'canada_gun_dir_development'
Created database 'canada_gun_dir_test'
```

- Database initialization

  - import from spread sheet `bundle exec rails import:data`

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- front end using Bulma
  - [tutorial](https://medium.com/@caprioli.tyler/using-a-framework-to-make-beautiful-websites-bulma-w-rails-65ff6d5f31fc)
  - the secret is to add `import bulma` to `app/javascript/packs/application.scss`

## roadmap

DB relations

- user ->
  - reddit username
  - club(S) (array for now)
  - province (string)
  - city/region (string)
  - note (text)
- [x] TODO: enforce username not null rule
      ~in DB~ not in DB, but in the rake import
- [x] ~allow~ no do not allow. keepin our standard high. repeated entries for now (username cannot be null but dones't have to be unique)
- [x] ~regex~ simple substring search the notes field. Add RPAL attribute!!
- [x] enable search with license info

* make a simple UI
  - [x] header
  - [x] project intro tab, add links and redirects in the tabs
  - [x] interpolate the username with URL
  - [x] make it at least somewhat mobile friendly -> nav bar hamburger icon js
  - [x] render the individual show pages when on mobile
  - [x] wrap the note in a warning tile
* populate with real data
  - [x] don't commit user info to this repo
  - [x] write a script to read the excel entries and send them to the heroku db
  - [did not do] get rid of empty space entries, change to nil
  - [x] convert to lower cases in db. search keyword also convert to lower case.

## notes

- users with multiple entries: only the first one is recorded.
- the conditions are combined with 'AND' statements in SQL (essentially)
- how to upload the DB entries to heroku
  - https://stackoverflow.com/questions/27761986/scp-file-from-local-to-heroku-server
  - http://evans.io/legacy/posts/heroku-survival-guide/
  - wget or scp on remote from local (i went with wget)
  - run ` heroku rake import:data`

## roadmap for 2.0

- make proper DB fields for properties
- enable one to many relationships
- integrate React w/ Rails backend
- at least have a save as PDF option
- publish an API/gem/npm pkg that has all the gun club locations, organized by province, geo loc, etc
