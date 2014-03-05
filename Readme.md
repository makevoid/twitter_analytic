# Twitter Test

### Command line tool

### Install:

  - rename **env.rb.default** to **env.rb**
  - add your twitter **consumer_secret** and **access_token_secret**


### Specs

  receives twitter account name as argument

    ./bin/twitter_analytic rails


  returns a list of hashtags (#rails) and mentions (@rails) used in the latest 200 tweets posted from the account
  (ordered from most more appearances to less appearances)


### notes

Tests need internet connection