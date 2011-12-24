Given /^I am on the landing page$/ do
  visit "/"
end

When /^I click the picker card so I can play again$/ do
  click_link "picker-card"
end

Then /^the appropriate meta tags should be present$/ do
  within :xpath, ".//head" do
    page.must_have_selector :xpath, ".//meta[@name='description']"
    page.must_have_selector :xpath, ".//meta[@name='author']"
  end
end

Then /^I should see a standard layout$/ do
  steps %Q{
    Then I should see a page title of "Pick me!"
    And the css for a title bar should be present
    And I should see the brand logo "Pick me!"
  }
end

Then /^I should see a page title of "([^"]*)"$/ do |title|
  within :xpath, ".//head/title" do
    page.must_have_content "Pick me!" 
  end
end

Then /^the css for a title bar should be present$/ do
  page.must_have_css ".topbar .fill .container"
end

Then /^I should see the brand logo "([^"]*)"$/ do |brand|
  within :css, ".topbar .brand" do
    page.must_have_content "Pick me!"
  end
end
