Given /^I am on the landing page$/ do
  visit "/"
end

Then /^my browser should see appropriate meta tags$/ do
  within :xpath, ".//head" do
    page.must_have_selector :xpath, ".//meta[@name='description']"
    page.must_have_selector :xpath, ".//meta[@name='author']"
  end
end

Then /^I should see a standard layout$/ do
  steps %Q{
    Then I should see a page title of "Pick me!"
    And I should see the title bar
    And I should see the brand logo "Pick me!"
  }
end

Then /^I should see a page title of "([^"]*)"$/ do |title|
  within :xpath, ".//head/title" do
    page.must_have_content "Pick me!" 
  end
end

Then /^I should see the title bar$/ do
  page.must_have_css ".topbar .fill .container"
end

Then /^I should see the brand logo "([^"]*)"$/ do |brand|
  within :css, ".topbar .brand" do
    page.must_have_content "Pick me!"
  end
end
