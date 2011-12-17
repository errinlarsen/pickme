require "minitest/autorun"
require_relative "../spec_helper_lite"
require_relative "../../models/picker"

describe Picker do
  before do
    @it = Picker.new
  end

  it "should start with blank attributes" do
    @it.name.must_be_nil
    @it.description.must_be_nil
  end

  it "should support reading and writing a name" do
    @it.name = "Foo"
    @it.name.must_equal "Foo"
  end

  it "should support reading and writing a description" do
    @it.description = "Bar"
    @it.description.must_equal "Bar"
  end

  it "should support setting attributes in the initializer" do
    it = Picker.new(:name => "Foo", :description => "Foo is Bar")
    it.name.must_equal "Foo"
    it.description.must_equal "Foo is Bar"
  end

  describe "#insert" do
    before do
      @deck = MiniTest::Mock.new
      @it.deck = @deck
    end

    after do
      @deck.verify
    end

    it "should add the picker to the deck" do
      @deck.expect :add_picker, nil, [@it]
      @it.insert
    end
  end
end
