path = File.expand_path "../../", __FILE__
require "#{path}/config/env.rb"

class TwitterAnalytic

  def self.analyze(user)
    new(user).analyze
  end

  def initialize(user)
    @user = user
  end

  def analyze
    puts "do stuff"
    "stuff"
  end

end