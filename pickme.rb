require "rubygems"
require "bundler/setup"
require "sinatra"

require_relative "./models/picker"

configure do
  foo = Picker.new(:name => "Foo",
                   :description => "The player who has foo should go first")
  set :deck, [foo]
end

get "/" do
  haml :index
end
