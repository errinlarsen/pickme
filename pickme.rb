require "rubygems"
require "bundler/setup"
require "sinatra"

require_relative "./models/picker"

get "/" do
  haml :index
end
