require "rubygems"
require "bundler/setup"
require "sinatra"
require "haml"

require_relative "models/picker_deck"

configure do
  deck = PickerDeck.new
  deck.add_cards_from_file("./cards/default_cards.rb")
  set :deck, deck
end

get "/" do
  @card = settings.deck.draw_a_card
  haml :index
end

get "/list" do
  @cards = settings.deck.cards
  haml :list
end
