require 'sinatra'
require 'haml'

set :root, File.expand_path(File.dirname(__FILE__))

set :haml, {:format => :html5 }

get '/' do
  haml :index
end
