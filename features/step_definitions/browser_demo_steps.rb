Given(/^I navigate to the homepage$/) do
  local_homepage.visit
  local_homepage.verify_page_displayed
end

Then(/^I can see the Test Evolve logo$/) do
  local_homepage.verify_logo_displayed
end

And(/^the page header text is "([^"]*)"$/) do |expected_text|
  local_homepage.verify_header_text(expected_text)
end

Given(/^I navigate to the forms page$/) do
  local_forms_page.visit
  TestEvolve.visual_check('forms page')
end

When(/^I enter test data in all of the required details into the form$/) do
  local_forms_page.enter_form_details
end

And(/^I submit the form data$/) do
  local_forms_page.submit_data
end

Then(/^the form submission confirmation page is displayed$/) do
  local_form_confirmation_page.verify_page_displayed
end

When(/^I enter the following data into the form$/) do |table|
  # table is a table.hashes.keys # => [:First Name, :Last Name, :Description]
  character = table.hashes.first
  local_forms_page.enter_form_details_from_hash(character)
end
