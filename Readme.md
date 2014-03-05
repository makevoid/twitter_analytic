# Twitter Test

### Command line tool

### Install:

- rename **env.rb.default** to **env.rb**
- add your twitter **consumer_secret** and **access_token_secret**

then run:

    bundle

then:

    ./bin/twitter_analytic rails


### Running the tests:

      rspec spec/twitter_analytic_spec.rb

(use bundle exec if rspec alone doesn't resolves)

### Delete cache files

run:

    ruby lib/tasks/delete_cache.rb

to delete cache files

### Running the console

    irb -r ./config/env.rb
    require "#{PATH}/lib/twitter_analytic"

then for example:

    ta = TwitterAnalytic.new "rails"
    ta.analyze


### notes:

Tests need internet connection (the first time, before the cache is populated)

I could have used require_relative but require + File.expand_path is my favourite method

I implemented caching as it speeds up the development process, especially when test-driven

I'm not testing the cache code as it may be out of this trial scope


### Specifications:

  receives twitter account name as argument

    ./bin/twitter_analytic rails


  returns a list of hashtags (#rails) and mentions (@rails) used in the latest 200 tweets posted from the account
  (ordered from most more appearances to less appearances)
