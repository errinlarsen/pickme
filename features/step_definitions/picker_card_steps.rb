Then /^I should see a picker card named "([^"]*)"$/ do |name|
  steps %Q[
    Then the css for a card should be present
    And I should see a card named "#{name}"
    And the card's description should be:
      """
      The first player is the one who has foo
      """
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

Then /^the card's description should be:$/ do |description|
  within :css, ".picker-card .description" do
    page.must_have_content description
  end
end
