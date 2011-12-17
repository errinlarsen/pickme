require "rubygems"
require "bundler/setup"
require "sinatra"

require_relative "./models/picker"

foo = Picker.new(:name => "Foo",
                 :description => "The player who has foo should go first")
DECK = [foo]

get "/" do
  puts DECK.inspect
  @card = DECK.shift
  haml :index
end
