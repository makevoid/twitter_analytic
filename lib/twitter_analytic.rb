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

  def load_tweets
    unless cache_present?(@user)
      cache_save @user, TWI.user_timeline(@user, count: 200).map{ |tweet| tweet.text }
    else
      cache_load @user
    end
  end

end