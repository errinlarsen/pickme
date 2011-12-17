require "rubygems"
require "bundler/setup"
require "sinatra"

require_relative "./models/picker"

get "/" do
  @card = Picker.new(:name => "Foo",
                 :description => "The player who has foo should go first")
  haml :index
end
