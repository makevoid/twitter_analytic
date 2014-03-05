class TwitterAnalytic

  def self.analyze(user)
    new(user).analyze
  end

  def initialize(user)
    @user = user
  end

  def analyze
    puts "do stuff"
  end

end