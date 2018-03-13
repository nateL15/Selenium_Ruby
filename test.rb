require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://www.amazon.com"

driver.find_element(:id, 'twotabsearchtextbox').send_keys("computers")
driver.find_element(:id, 'Go').click

wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
begin
  element = wait.until { driver.find_element(:id => "search-title") }
  element.text.include? 'Search Results for: agile'
ensure
  driver.quit
end