require "rubygems"
require "bundler/setup"
require "sinatra"
require "haml"

require_relative "models/picker_deck"

configure do
  deck = PickerDeck.new
  deck.new_card(
    :name => "Freshen up",
    :description => "The player who most recently bathed should go first"
  ).add_to_deck
  deck.new_card(
    :name => "To the left",
    :description => "The player left of the pickme player should go first"
  ).add_to_deck
  deck.new_card(
    :name => "Cake day",
    :description => "The player with the next birthday should go first"
  ).add_to_deck
  deck.new_card(
    :name => "Geezer",
    :description => "The oldest player should go first"
  ).add_to_deck
  deck.new_card(
    :name => "Concise correspondance",
    :description => "The player with the shortest email address should go first"
  ).add_to_deck

  # Wouldn't it be cool if we could do this:
  # deck = PickerDeck.new do
  #   card "Foo", "The player who most recently bathed should go first"
  #   card "Bar", "The player left of the pickme player should go first"
  # end

  set :deck, deck
end

get "/" do
  @card = settings.deck.draw_a_card
  haml :index
end
