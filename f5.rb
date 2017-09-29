require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers


driver = Selenium::WebDriver.for :chrome


driver.get 'https://212.61.222.170/tmui/login.jsp'
expect(driver.title).to eql 'BIG-IP® - ic-lab.claranet.nl (10.255.0.200)'
element = driver.find_element :name => "username"
element.send_keys "paul.gomersbach"
element = driver.find_element :name => "passwd"
element.send_keys "aser*#1qD"
element.submit
#element = driver.find_element(:xpath => "//*[@id=\"partition_control\"]/a")
# dropDownMenu = driver.find_element(:id, 'xui')

driver.save_screenshot 'f5.png'
puts "Page title is #{driver.title}"

driver.get "http://google.com"
element = driver.find_element :name => "q"
element.send_keys "Cheese!"
element.submit

puts "Page title is #{driver.title}"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.title.downcase.start_with? "cheese!" }

puts "Page title is #{driver.title}"
driver.quit
