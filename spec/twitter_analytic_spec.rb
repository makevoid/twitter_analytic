path = File.expand_path "../../", __FILE__

require "#{path}/lib/twitter_analytic"



describe TwitterAnalytic do

  it "should analyze tweets" do
    result = TwitterAnalytic.new("rails").analyze
    result.class.should == String
  end

end