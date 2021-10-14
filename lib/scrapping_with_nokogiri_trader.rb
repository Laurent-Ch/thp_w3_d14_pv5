require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'restclient'

def scrapper(i)
  # This is the commande that gives us access to the data
  page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))

  # Getting the relevant information
  crypto_names = page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[2]/div/a[2]")
  crypto_prices = page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[5]/div/a")
  return crypto_names.text => crypto_prices.text
end

def perform
  result = []
  puts "Here is an array of hashes, each one containing the name of a cryptocurrency associated with its respective price: "
  20.times do |i|
    result << scrapper(i + 1)
  end
  return result
end

print perform
puts

#   NB The two following methods work.
#   First method.
# page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
# puts page.class   # => Nokogiri::HTML::Document

#   Second method.
#   page = Nokogiri::HTML(RestClient.get('https://coinmarketcap.com/all/views/all/'))
#   puts page.class # => Nokogiri::HTML::Document
