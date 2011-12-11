require "rubygems"
require "bundler/setup"
require "sinatra"

get "/" do
  haml :index
end
