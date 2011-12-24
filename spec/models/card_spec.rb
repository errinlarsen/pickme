require "minitest/autorun"
require_relative "../spec_helper_lite"
require_relative "../../models/card"

describe Card do
  before do
    @it = Card.new
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
    it = Card.new(:name => "Foo", :description => "Foo is Bar")
    it.name.must_equal "Foo"
    it.description.must_equal "Foo is Bar"
  end

  describe "#include" do
    before do
      @game = MiniTest::Mock.new
      @it.game = @game
    end

    after do
      @game.verify
    end

    it "should add the picker to the deck" do
      @game.expect :add_card, nil, [@it]
      @it.include
    end
  end
end
