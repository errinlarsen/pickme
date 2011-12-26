require "minitest/autorun"
require_relative "../spec_helper_lite"
require_relative "../../models/picker_card"

describe PickerCard do
  before do
    @it = PickerCard.new
  end

  it "should start with blank attributes" do
    @it.name.must_be_nil
    @it.description.must_be_nil
  end

  it "should support reading and writing a name" do
    @it.name = "Some name"
    @it.name.must_equal "Some name"
  end

  describe "#name" do
    it "should change the name attribute when passed a string" do
      @it.name "Some other name"
      @it.name.must_equal "Some other name"
    end
  end

  it "should support reading and writing a description" do
    @it.description = "Some description"
    @it.description.must_equal "Some description"
  end

  describe "#description" do
    it "should change the description attribute when passed a string" do
      @it.description "Some other description"
      @it.description.must_equal "Some other description"
    end
  end

  it "should support setting attributes in the initializer" do
    it = PickerCard.new(:name => "Foo", :description => "Foo is Bar")
    it.name.must_equal "Foo"
    it.description.must_equal "Foo is Bar"
  end

  describe "#add_to_deck" do
    before do
      @deck = MiniTest::Mock.new
      @it.deck = @deck
    end

    after do
      @deck.verify
    end

    it "should add the picker to the deck" do
      @deck.expect :add_card, nil, [@it]
      @it.add_to_deck
    end
  end
end
