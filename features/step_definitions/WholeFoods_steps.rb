Given(/^We navigate to the whole foods website$/) do
  driver.navigate.to "https://www.wholefoodsmarket.com/"
end

When(/^We search for "([^"]*)"$/) do
  driver.find_element(:class, 'svg-search-icon-dims').click
  driver.find_element(:id, 'storeSearch').send_keys('eggs')
  @driver.action.send_keys(:return).perform
end

Then(/^The results for "([^"]*)"$/) do |arg|
  pending
end

And(/^We add "([^"]*)" to our cart$/) do |arg|
  pending
end