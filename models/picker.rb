class Picker
  attr_accessor :deck, :name, :description

  def initialize(attrs={})
    attrs.each { |attr, val| send("#{attr}=", val) }
  end
end
