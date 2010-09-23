require './wednesday'

QUIET_TWEET = "#WatchWednesday *jashkenas coffee-script docco *cloudhead less *github gollum *creationix postgres-js http://watchwednesday.com/benatkin"
QUIET_TWEET_DATA =
  [{:begin=>15, # *jashkenas coffee-script docco
    :text=>"*jashkenas",
    :url=>"http://github.com/jashkenas",
    :end=>27},
   {:begin=>27,
    :text=>"coffee-script",
    :url=>"http://github.com/jashkenas/coffee-script",
    :end=>41},
   {:begin=>41,
    :text=>"docco",
    :url=>"http://github.com/jashkenas/docco",
    :end=>47},
   {:begin=>47, # *cloudhead less
    :text=>"*cloudhead",
    :url=>"http://github.com/cloudhead",
    :end=>58},
   {:begin=>58,
    :text=>"less",
    :url=>"http://github.com/cloudhead/less",
    :end=>63},
   {:begin=>63, # *github gollum
    :text=>"*github",
    :url=>"http://github.com/github",
    :end=>71},
   {:begin=>71,
    :text=>"gollum",
    :url=>"http://github.com/github/gollum",
    :end=>78},
   {:begin=>78, # *creationix postgres-js
    :text=>"*creationix",
    :url=>"http://github.com/creationix",
    :end=>90}, 
   {:begin=>90,
    :text=>"postgres-js",
    :url=>"http://github.com/creationix/postgres-js",
    :end=>102}]

describe WednesdayTweet, "#render" do
  it "renders correctly" do
    tweet = WednesdayTweet.new QUIET_TWEET
    tweet.entities.should == QUIET_TWEET_DATA
  end
end
