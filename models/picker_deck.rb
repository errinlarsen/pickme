require_relative "picker_card"

class PickerDeck
  attr_reader :deck
  attr_writer :card_maker

  def initialize(cards=[])
    @cards = cards
    setup_deck
  end

  def new_card(*args, &block)
    return card_maker.call(*args, &block).tap do |new_card|
      new_card.deck = self
    end
  end

  def add_card(card)
    @cards << card
  end

  def add_cards_from_file(path)
    instance_eval(File.read(path), path)
  end

  def draw_a_card
    setup_deck if @deck.empty?
    return draw_card
  end


  private
  def card_maker 
    return @card_maker ||= PickerCard.public_method(:new)
  end

  def setup_deck
    @deck = @cards.shuffle
  end

  def draw_card
    return @deck.shift
  end

  def picker(name=nil, description=nil, &block)
    new_card = new_card(:name => name, :description=>description, &block)
    new_card.add_to_deck
  end
end
