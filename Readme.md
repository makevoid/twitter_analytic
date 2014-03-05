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

### Specifications:

  receives twitter account name as argument

    ./bin/twitter_analytic rails


  returns a list of hashtags (#rails) and mentions (@rails) used in the latest 200 tweets posted from the account
  (ordered from most more appearances to less appearances)


### notes

Tests need internet connection

I could have used require_relative but require + File.expand_path is my favourite method