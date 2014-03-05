path = File.expand_path "../../", __FILE__

require "#{path}/lib/twitter_analytic"



describe TwitterAnalytic do

  context "analyze" do

    before :all do
      @analytic = TwitterAnalytic.new("rails")
      @analytic.analyze
    end

    describe "results_raw" do
      it "has valid type and size" do
        @analytic.results_raw.class.should == Array
        @analytic.results_raw.size.should  == 200
      end
    end

    describe "results" do
      it "has hashtags" do
        @analytic.results.keys.should include(:hashtags)
      end
      it "has mentions" do
        @analytic.results.keys.should include(:mentions)
      end
    end

  end

end