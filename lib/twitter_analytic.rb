path = File.expand_path "../../", __FILE__
require "#{path}/config/env.rb"

class TwitterAnalytic

  attr_reader :results, :results_raw

  include Caching

  def self.analyze(user)
    new(user).analyze
  end

  def initialize(user)
    @user = user
  end

  def analyze
    @results_raw = load_tweets
    @results = do_analysis
    str_format
  end

  private

  def str_format
    out  = "Hashtags:\n"
    out << @results[:hashtags].map{ |tag, count| "#{tag}: #{count}" }.join("\n")
    out << "\n#{"-" * 80}\n"
    out << "Mentions:\n"
    out << @results[:mentions].map{ |usr, count| "#{usr}: #{count}" }.join("\n")
    out << "\n"
    out
  end

  def do_analysis
    results = @results_raw.join " "

    # note: this method can be refactored

    hashes = results.scan(/#\w+/).uniq
    ments  = results.scan(/@\w+/).uniq

    hashtags = {}
    hashes.each do |hash|
      scan = results.scan(hash)
      hashtags[hash] = scan.count
    end

    mentions = {}
    ments.each do |ment|
      scan = results.scan(ment)
      mentions[ment] = scan.count
    end

    { hashtags: sort(hashtags), mentions: sort(mentions) }
  end

  def sort(hash)
    hash.sort_by { |key, count| -count }
  end

  def load_tweets
    unless cache_present?(@user)
      cache_save @user, TWI.user_timeline(@user, count: 200).map{ |tweet| tweet.text }
    else
      cache_load @user
    end
  end

end