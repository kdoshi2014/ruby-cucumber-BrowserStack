require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'


Given /^I am opening (.+)$/ do |url|
  @browser.navigate.to "https://www.browserstack.com"
  @browser.manage.window.maximize
end

When /^I click on "([^"]*)" as "([^"]*)"$/ do |type, value|
  @element = @browser.find_element(type, value).click
end

And /^I enter email as "([^"]*)" and password as "([^"]*)"$/ do |email, password|
  @element = @browser.find_element(:id, 'user_email_login')
  @element.send_keys email
  @element = @browser.find_element(:id, 'user_password')
  @element.send_keys password
end

Then /^I login$/ do
  @browser.find_element(:id, 'user_submit').click
end

Then /^I close the local window$/ do
@browser.find_element(:id, 'skip-local-installation').click rescue false
end

Then /^I click on the desired browser$/ do
  @browser.find_element(:xpath, '//*[@id="rf-browsers"]/div/div[2]/div[4]/ul/li[1]/a').click
end

Then /^I should see the title as "([^"]*)"$/ do |title|
  raise "Fail" if @browser.title != title
end