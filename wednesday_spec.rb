require './wednesday'

QUIET_TWEET = "#WatchWednesday *jashkenas coffee-script docco *cloudhead less *github gollum *creationix postgres-js http://watchwednesday.com/benatkin"
QUIET_STR = "#WatchWednesday " +
            "<a href='http://github.com/jashkenas'>*jashkenas</a> " +
            "<a href='http://github.com/jashkenas/coffee-script'>coffee-script</a> " +
            "<a href='http://github.com/jashkenas/docco'>docco</a> " +
            "<a href='http://github.com/cloudhead'>*cloudhead</a> " +
            "<a href='http://github.com/cloudhead/less'>less</a> " +
            "<a href='http://github.com/github'>*github</a> " +
            "<a href='http://github.com/github/gollum'>gollum</a> " +
            "<a href='http://github.com/creationix'>*creationix</a> " +
            "<a href='http://github.com/creationix/postgres-js'>postgres-js</a> " +
            "http://watchwednesday.com/benatkin"

describe WednesdayTweet, "#render" do
  it "renders correctly" do
    tweet = WednesdayTweet.new QUIET_TWEET
    markup = tweet.render
    puts markup.inspect
    markup.should == QUIET_STR
  end
end

