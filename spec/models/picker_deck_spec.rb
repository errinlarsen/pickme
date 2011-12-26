require "minitest/autorun"
require "ostruct"
require "tempfile"
require_relative "../spec_helper_lite"
require_relative "../../models/picker_deck"

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

    it "should set the new card's deck to itself" do
      @it.new_card.deck.must_equal @it
    end

    it "should accept an attribute hash on behalf of the card maker" do
      new_card_attrs = { name: "Foo", description: "bar" }

      card_maker = MiniTest::Mock.new
      card_maker.expect(:call, @new_card, [new_card_attrs])
      @it.card_maker = card_maker

      @it.new_card(name: "Foo", description: "bar")
      card_maker.verify
    end
  end

  describe "#add_cards_from_file" do
    before do
      @some_card = OpenStruct.new
      @card_maker = MiniTest::Mock.new
      @tmp = Tempfile.new("Foo")
    end

    after do
      @card_maker.verify
      @tmp.unlink
    end

    it "should create a card given a name and description in a file" do
      some_card_attrs = { name: "Foo", description: "bar" }
      @card_maker.expect(:call, @some_card, [some_card_attrs])
      @it.card_maker = @card_maker

      @tmp.write("picker \"Foo\", \"bar\"")
      @tmp.close

      @it.add_cards_from_file(@tmp.path)
    end

    it "should create a card given a name and block in a file" do
      some_card_attrs = { name: "Foo", description: nil }
      @card_maker.expect(:call, @some_card, [some_card_attrs])
      @it.card_maker = @card_maker

      @tmp.write("picker \"Foo\" do\n  description \"bar\"\nend")
      @tmp.close

      @it.add_cards_from_file(@tmp.path)
    end
  end

  describe "#draw_a_card" do
    before do
      @cards = []
      stacked_deck = []
      class << stacked_deck; def shuffle; dup; end; end

      @it = PickerDeck.new(stacked_deck)
      2.times do
        new_card = Object.new
        @cards << new_card
        @it.add_card(new_card)
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
