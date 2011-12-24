require "minitest/autorun"
require "ostruct"
require_relative "../spec_helper_lite"
require_relative "../../models/game"

describe PickerDeck do
  before do
    @it = PickerDeck.new([])
  end

  it "should have an empty deck" do
    @it.deck.must_be_empty
  end

  describe "#new_card" do
    before do
      @new_card = OpenStruct.new
      @it.card_maker = ->{ @new_card }
    end

    it "should return a new card" do
      @it.new_card.must_equal @new_card
    end

    it "should accept an attribute hash on behalf of the card maker" do
      card_maker = MiniTest::Mock.new
      card_maker.expect(:call, @new_card, [{ :name => "Foo", :description => "bar" }])
      @it.card_maker = card_maker
      @it.new_card(:name => "Foo", :description => "bar")
      card_maker.verify
    end
  end

  describe "#draw_a_card" do
    before do
      @cards = []
      test_deck = []
      class << test_deck; def shuffle; dup; end; end
      @it = PickerDeck.new(test_deck)
      2.times do
        some_card = Object.new
        @cards << some_card
        @it.add_card(some_card)
      end
    end

    it "should return the first card in the deck" do
      @it.draw_a_card.must_equal @cards.first
    end

    it "should return the second card in the deck when called twice" do
      @it.draw_a_card
      @it.draw_a_card.must_equal @cards[1]
    end

    it "should reset the deck when all cards have been drawn" do
      @cards.size.times { @it.draw_a_card }
      @it.draw_a_card.must_equal @cards.first
    end
  end
end
