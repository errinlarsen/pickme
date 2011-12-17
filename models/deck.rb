require_relative "picker"

class Deck
  attr_reader :pickers
  attr_writer :picker_maker

  def initialize
    @pickers = []
  end

  def new_picker(*args)
    picker_maker.call(*args)
  end


  private
  def picker_maker 
    @picker_maker ||= Picker.public_method(:new)
  end
end
