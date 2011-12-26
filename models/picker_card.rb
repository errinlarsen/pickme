class PickerCard
  attr_accessor :deck, :name, :description

  def initialize(attrs={}, &block)
    attrs.each { |attr, val| send("#{attr}=", val) }
    instance_eval(&block) if block
  end

  def add_to_deck
    deck.add_card(self)
  end

  def description(d=nil)
    return @description unless d
    @description = d
  end

  def name(n=nil)
    return @name unless n
    @name = n
  end
end
