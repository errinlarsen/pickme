require "rubygems"
require "bundler/setup"
require "sinatra"
require "haml"

require_relative "models/picker_deck"
# temporary solution for the lack of persistance
require_relative "lib/static_cards_creator"

configure do
  deck = PickerDeck.new
  StaticCardsCreator.new(deck).add_cards!

  set :deck, deck
end

get "/" do
  @card = settings.deck.draw_a_card
  haml :index
end
