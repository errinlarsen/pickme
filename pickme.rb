require "rubygems"
require "bundler/setup"
require "sinatra"
require "haml"

require_relative "models/game"

configure do
  game = Game.new
  game.new_card(
    :name => "Freshen up",
    :description => "The player who most recently bathed should go first"
  ).include
  game.new_card(
    :name => "To the left",
    :description => "The player left of the pickme player should go first"
  ).include
  game.new_card(
    :name => "Cake day",
    :description => "The player with the next birthday should go first"
  ).include
  game.new_card(
    :name => "Geezer",
    :description => "The oldest player should go first"
  ).include
  game.new_card(
    :name => "Concise correspondance",
    :description => "The player with the shortest email address should go first"
  ).include

  # Wouldn't it be cool if we could do this:
  # game = Game.new do
  #   card "Foo", "The player who most recently bathed should go first"
  #   card "Bar", "The player left of the pickme player should go first"
  # end

  set :game, game
end

get "/" do
  @card = settings.game.play
  haml :index
end
