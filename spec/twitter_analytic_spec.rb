path = File.expand_path "../../", __FILE__

require "#{path}/lib/twitter_analytic"



describe TwitterAnalytic do

  context "analyze" do

    before :all do
      @analytic = TwitterAnalytic.new "rails"
      @return_value = @analytic.analyze
    end

    describe "return value" do
      it "'s all about hashtags and mentions" do
        @return_value.should =~ /Hashtags:\n/
        @return_value.should =~ /Mentions:\n/
      end
    end

    describe "results_raw" do
      it "has valid type and size" do
        @analytic.results_raw.class.should == Array
        @analytic.results_raw.size.should  == 200
      end
    end

    describe "results" do

      let(:results) { @analytic.results }

      it "has hashtags" do
        results.keys.should include(:hashtags)
      end
      it "has mentions" do
        results.keys.should include(:mentions)
      end

      it "sort hashtags by return value" do
        sorted = results[:hashtags].sort_by { |key, count| -count }
        results[:hashtags].should == sorted
      end

      it "sort mentions by return value" do
        # different type of test on this just to be sure sort_by is not monkeypatched
        first_value = results[:mentions].first[1]
        first_value.should > results[:mentions][1][1]
        first_value.should > results[:mentions].last[1]
      end
    end

  end

end