require_relative "card"

class Game
  attr_reader :deck
  attr_writer :card_maker

  def initialize(cards=[])
    @cards = cards
    setup_deck
  end

  def new_card(*args)
    return card_maker.call(*args).tap do |new_card|
      new_card.game = self
    end
  end

  def add_card(card)
    @cards << card
  end

  def draw_a_card
    setup_deck if @deck.empty?
    return draw_card
  end


  private
  def card_maker 
    return @card_maker ||= Card.public_method(:new)
  end

  def setup_deck
    @deck = @cards.shuffle
  end

  def draw_card
    return @deck.shift
  end
end
