require "rubygems"
require "bundler/setup"
require "sinatra"
require "haml"

require_relative "models/game"

configure do
  game = Game.new
  foo = game.new_card(:name => "Foo",
                      :description => "The player who has foo should go first")
  bar = game.new_card(:name => "Bar",
                      :description => "The player who has bar should go first")
  foo.include
  bar.include
  set :game, game
end

get "/" do
  @card = settings.game.play
  haml :index
end
