require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
municipalities = page.xpath('//a[contains(@href, "95")]/@href').map(&:text)
municipalities_url = municipalities.each{|index|index[0] = ""}.map{|link|"https://www.annuaire-des-mairies.com" + link}

all_emails = []

puts "▇" * 46
puts "▇▇▇▇▇ scrapping on all pages. Please wait ▇▇▇▇"
for i in 0..(municipalities_url.length - 1)
  if i % 46 == 0 && i > 10
    print "\n"
  end
  parser_pages = Nokogiri::HTML(URI.open(municipalities_url[i]))
  all_emails += parser_pages.xpath('//tr/td[contains(text(), "@")]').map(&:text)
  if i != 184
    print "▇"
  end
end

all_emails.each do |index|
  puts ">> #{index}"
  sleep(0.05)
end

puts "▇" * 15 + " Scrapping done " + "▇" * 15