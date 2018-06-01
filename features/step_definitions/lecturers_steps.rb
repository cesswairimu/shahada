# files.

# require 'capybara/cucumber'

require 'capybara'
require 'cucumber/rails'
include Capybara::DSL
Given(/^I am on home page$/) do
  visit '/static_pages/home'
  # get '/static_pages/home'

end
When(/^I click on "([^"]*)" button$/) do |arg1|
end

Then(/^I should see "([^"]*)"$/) do |arg1|
end

Given(/^I am on users_new page$/) do
end

Given(/^I fill in the form with$/) do
end

When(/^I click the "([^"]*)" button$/) do |arg1|
end
