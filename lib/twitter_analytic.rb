path = File.expand_path "../../", __FILE__
require "#{path}/config/env.rb"

class TwitterAnalytic

  include Caching

  def self.analyze(user)
    new(user).analyze
  end

  def initialize(user)
    @user = user
  end

  def analyze
    puts "do stuff"
    @tweets = load_tweets
    "stuff"
  end

  private

  def load_tweets
    unless cache_present?(@user)
      cache_save @user, tweets_get
    else
      cache_load @user
    end
  end

  def tweets_get
    twi = Twitter::REST::Client.new do |config|
      config.consumer_key        = "JRLCl4w6b6G328ffAc1g"
      config.access_token        = "2370302586-pjEvKx61VrHGh8STYM0MEWab4dDdTh6TY9c8lRN"

      config.consumer_secret     = TWITTER_CONSUMER_SECRET
      config.access_token_secret = TWITTER_ACCESS_TOKEN_SECRET
    end
    twi.user_timeline(@user, count: 200).map{ |tweet| tweet.text }
  end

end