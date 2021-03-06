Given /^the following picker cards exist:$/ do |card_table|
  stacked_deck = []
  class << stacked_deck; def shuffle; dup; end; end
  Capybara.app.settings.deck = PickerDeck.new(stacked_deck)

  card_table.hashes.each do |new_card|
    Capybara.app.settings.deck.new_card(
      name: new_card[:name], description: new_card[:description]
    ).add_to_deck
  end
end

Then /^I should see a picker card named "([^"]*)" with description:$/ do |name, description|
  steps %Q[
    Then I should see a card
    And the card named "#{name}" has the description "#{description}"
  ]
end

Then /^I should see a card$/ do
  page.must_have_css ".picker-card"
end

Then /^the card should be a link to play again$/ do
  within :css, ".picker-card" do
    page.must_have_css "a#picker-card"
  end
end

Then /^the card named "([^"]*)" has the description "([^"]*)"$/ do |name, description|
  within :css, ".picker-card##{name.downcase.gsub(/\s/, '-')} .name" do
    page.must_have_content name
  end
  within :css, ".picker-card##{name.downcase.gsub(/\s/, '-')} .description" do
    page.must_have_content description
  end
end

Then /^I should see a list of picker cards$/ do
  within :css, "ul.picker-cards-list" do
    page.must_have_css "li.picker-card"
  end
end
