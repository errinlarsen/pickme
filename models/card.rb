class Card
  attr_accessor :game, :name, :description

  def initialize(attrs={})
    attrs.each { |attr, val| send("#{attr}=", val) }
  end

  def include
    game.add_card(self)
  end
end
