require_relative "card"

class Game
  attr_reader :deck
  attr_writer :card_maker

  def initialize
    @deck = []
  end

  def new_card(*args)
    return card_maker.call(*args).tap do |new_card|
      new_card.game = self
    end
  end

  def add_card(card)
    @deck << card
  end

  def play
    return draw_card
  end


  private
  def card_maker 
    return @card_maker ||= Card.public_method(:new)
  end

  def draw_card
    return @deck.first
  end
end
