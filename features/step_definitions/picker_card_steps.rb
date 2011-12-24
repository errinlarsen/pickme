Given /^the following picker cards exist:$/ do |card_table|
  test_deck = []
  class << test_deck; def shuffle; dup; end; end
  Capybara.app.settings.game = Game.new(test_deck)
  card_table.hashes.each do |card|
    Capybara.app.settings.game.new_card(
      :name => card[:name],
      :description => card[:description]
    ).include
  end
end

Then /^I should see a picker card named "([^"]*)"$/ do |name|
  steps %Q[
    Then the css for a card should be present
    And I should see a card named "#{name}"
  ]
end

Then /^the css for a card should be present$/ do
  page.must_have_css ".picker-card"
end

Then /^I should see a card named "([^"]*)"$/ do |name|
  within :css, ".picker-card .name" do
    page.must_have_content name
  end
end

Then /^I should see the picker card description:$/ do |description|
  within :css, ".picker-card .description" do
    page.must_have_content description
  end
end
