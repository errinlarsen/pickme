require_relative "card"

class Game
  attr_reader :deck
  attr_writer :card_maker

  def initialize
    @deck = []
  end

  def new_card(*args)
    card_maker.call(*args)
  end

  def add_card(card)
    @deck << card
  end


  private
  def card_maker 
    @card_maker ||= Card.public_method(:new)
  end
end
