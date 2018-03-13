require 'selenium-webdriver'
require 'cucumber'
require 'rspec'

driver = Selenium::WebDriver.for :chrome

Given(/^We navigate to Amazon$/) do
  driver.navigate.to "https://www.amazon.com"
end

When(/^We search for the word computers$/) do
  driver.find_element(:id, 'twotabsearchtextbox').send_keys('computers')
  driver.find_element(:class, 'nav-input').click
end

Then(/^The results for computer show$/) do
  wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
  begin
    element = wait.until { driver.find_element(:id => "autoscoping-backlink") }
    expect(element.text).to eq('Showing results in Electronics.Show instead results in All Departments.')
  ensure
    driver.quit
  end
end