require 'sinatra'
require 'haml'

ENTITY_RE = /(?:\s|\A)([*@]?[\w-]+)(?:\s|\Z)/

class WednesdayTweet
  attr_accessor :text

  def initialize(text)
    self.text = text
  end

  def entities
    user = nil
    a = []
    offset = 0
    loop do
      break if not text[offset..-1]
      match = text[offset..-1].match(ENTITY_RE)
      break if not match

      capture = match.captures[0]
      entity = {
        :text  => capture,
        :begin => offset + match.begin(0),
        :end   => offset + match.end(0),
        :url   => if capture[0..0] == '*' then
                    user = capture[1..-1]
                    'http://github.com/' + user
                  elsif capture[0..0] == '@' then
                    user = capture[1..-1]
                    'http://twitter.com/' + user
                  else
                    user && 'http://github.com/' + user + '/' + capture
                  end
      }
      a << entity

      offset += (match.pre_match + match.to_s).length
    end
    a
  end

  def render
    entities
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
