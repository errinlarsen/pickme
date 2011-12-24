class StaticCardsCreator
  def initialize(deck=[])
    @deck = deck
  end

  def add_cards!
    # Wouldn't it be cool if we could do this:
    # @deck = PickerDeck.new do
    #   card "Foo", "The player who most recently bathed should go first"
    #   card "Bar", "The player left of the pickme player should go first"
    # end
    
    cards.each do |name, description|
      @deck.new_card(name: name, description: description).add_to_deck
    end
  end


  private
  def cards
    return {
      "Freshen up"  => "The player who most recently bathed should go first",
      "To the left" => "The player left of the pickme player should go first",
      "Cake day"    => "The player with the next birthday should go first",
      "Geezer"      => "The oldest player should go first",
      "Concise correspondance" =>
                  "The player with the shortest email address should go first",
    }
  end
end
