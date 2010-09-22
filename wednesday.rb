require 'sinatra'
require 'haml'

class WednesdayTweet
  attr_accessor :text

  def initialize(text)
    self.text = text
  end

  def entities
    []
  end
end

set :root, File.expand_path(File.dirname(__FILE__))

set :haml, {:format => :html5 }

get '/' do
  haml :index
end
