require "minitest/autorun"
require "ostruct"
require_relative "../spec_helper_lite"
require_relative "../../models/deck"

describe Deck do
  before do
    @it = Deck.new
  end

  it "should have no pickers" do
    @it.pickers.must_be_empty
  end

  describe "#new_picker" do
    before do
      @new_picker = OpenStruct.new
      @it.picker_maker = ->{ @new_picker }
    end

    it "should return a new picker" do
      @it.new_picker.must_equal @new_picker
    end

    it "should accept an attribute hash on behalf of the picker maker" do
      picker_maker = MiniTest::Mock.new
      picker_maker.expect(:call, @new_picker, [{ :foo => 42, :bar => "baz" }])
      @it.picker_maker = picker_maker
      @it.new_picker(:foo => 42, :bar => "baz")
      picker_maker.verify
    end
  end
end
