require './wednesday'

QUIET_TWEET = "#WatchWednesday *jashkenas coffee-script docco *cloudhead less *github gollum *creationix postgres-js http://watchwednesday.com/benatkin"

describe WednesdayTweet, "#entities" do
  it "returns the correct data" do
    tweet = WednesdayTweet.new QUIET_TWEET
    tweet.entities.should == :generated_data
  end
end
