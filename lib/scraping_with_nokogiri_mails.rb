require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'restclient'

# Put the county page that you want in this variable
county_page = 'https://www.annuaire-des-mairies.com/val-d-oise.html'

# Gets the urls from each townhall within the county page
def get_townhall_urls(county_page)
  page = Nokogiri::HTML(URI.open(county_page))
  email_list = page.css('a[class=lientxt]')
  email_list.map { |link| link['href'] }
end

# Gets the townhall mail from an individual url page
def get_townhall_email(townhall_url)
  complete_url = "https://www.annuaire-des-mairies.com/#{townhall_url}"
  page = Nokogiri::HTML(URI.open(complete_url))
  townhall_email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
  townhall_email.text
end

def perform(county_page)
  raw_data = get_townhall_urls(county_page)
  raw_data.each do |i|
    get_townhall_email(i)
  end
end

print perform(county_page)
puts ()
