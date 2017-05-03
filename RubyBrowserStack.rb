require 'rubygems'
require 'selenium-webdriver'

class RubyBrowserStack

  # Input capabilities
  caps = Selenium::WebDriver::Remote::Capabilities.new
  caps["browser"] = "Chrome"
  caps["browser_version"] = "57.0"
  caps["browserstack.debug"] = "true"
  caps["name"] = "Testing Selenium 2 with Ruby on BrowserStack"
  
  driver = Selenium::WebDriver.for(:remote,
    :url => "http://username:key@hub-cloud.browserstack.com/wd/hub",
    :desired_capabilities => caps) 
    
=begin
  driver.navigate.to "http://www.google.com"
  element = driver.find_element(:name, 'q')
  element.send_keys "BrowserStack"
  element.submit
  puts driver.title
=end
    
  driver.navigate.to "https://www.browserstack.com" 
  driver.find_element(:link_text, 'Sign in').click
  
  element = driver.find_element(:id, 'user_email_login')
  element.send_keys "email"
  element = driver.find_element(:id, 'user_password')
  element.send_keys "password"
  
  driver.find_element(:id, 'user_submit').click
  
  driver.find_element(:id, 'skip-local-installation').click
  
  driver.find_element(:xpath, '//*[@id="rf-browsers"]/div/div[2]/div[4]/ul/li[1]/a').click
  
  driver.quit

end