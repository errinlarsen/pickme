require "minitest/autorun"
require "ostruct"
require_relative "../spec_helper_lite"
require_relative "../../models/game"

describe Game do
  before do
    @it = Game.new
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
      card_maker.expect(:call, @new_card, [{ :foo => 42, :bar => "baz" }])
      @it.card_maker = card_maker
      @it.new_card(:foo => 42, :bar => "baz")
      card_maker.verify
    end
  end

  describe "#play" do
    before do
      @cards = []
      2.times do
        foo = OpenStruct.new
        @cards << foo
        @it.add_card(foo)
      end
    end

    it "should return the first card in the deck" do
      @it.play.must_equal @cards.first
    end
  end
end
