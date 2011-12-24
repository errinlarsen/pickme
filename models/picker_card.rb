class PickerCard
  attr_accessor :deck, :name, :description

  def initialize(attrs={})
    attrs.each { |attr, val| send("#{attr}=", val) }
  end

  def add_to_deck
    deck.add_card(self)
  end
end
