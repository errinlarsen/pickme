class Picker
  attr_accessor :name, :description

  def initialize(attrs={})
    attrs.each { |attr, val| send("#{attr}=", val) }
  end
end
