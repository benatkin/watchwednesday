require 'sinatra'
require 'haml'

ENTITY_RE = /\A[\w*@][\w-]*\Z/

class WednesdayTweet
  attr_accessor :text

  def initialize(text)
    self.text = text
  end

  def render
    username = ''
    text.scan(/\s+|\S+/).map do |s|
      if s.match(ENTITY_RE)
        entity = s
        if entity[0..0] == '*' then
          username = entity[1..-1]
          "<a href='http://github.com/#{username}'>#{entity}</a>"
        elsif entity[0..0] == '@' then
          username = entity[1..-1]
          "<a href='http://twitter.com/#{username}'>#{entity}</a>"
        else
          "<a href='http://github.com/#{username}/#{entity}'>#{entity}</a>"
        end
      else
        s
      end
    end.join('')
  end
end

set :root, File.expand_path(File.dirname(__FILE__))

set :haml, {:format => :html5 }

get '/' do
  haml :index
end

get '/:username' do
  @username = params[:username]
  haml :user
end
