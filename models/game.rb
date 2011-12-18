require_relative "card"

class Game
  attr_reader :deck
  attr_writer :card_maker

  def initialize(deck_type=Array)
    @deck_type = deck_type
    @cards = @deck_type.new
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

  def play
    setup_deck if @deck.empty?
    return draw_card
  end


  private
  def card_maker 
    return @card_maker ||= Card.public_method(:new)
  end

  def setup_deck
    @deck = @deck_type.new(@cards).shuffle
  end

  def draw_card
    return @deck.shift
  end
end
