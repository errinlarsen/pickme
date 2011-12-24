class PickerCard
  attr_accessor :deck, :name, :description

  def initialize(attrs={})
    attrs.each { |attr, val| send("#{attr}=", val) }
  end

  def include
    deck.add_card(self)
  end
end
