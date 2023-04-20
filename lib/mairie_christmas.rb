require 'rubygems'
require 'nokogiri'
require 'open-uri'

def mairie_christmas
  if !page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
    return nil
  end
  municipalities = page.xpath('//a[contains(@href, "95")]/@href').map(&:text)
  municipalities_url = municipalities.each{|index|index[0] = ""}.map{|link|"https://www.annuaire-des-mairies.com" + link}
  all_emails = []
  all_cities = []
  cities = []
  emails = []

  puts "▇" * 46
  puts "▇▇▇▇▇ Scrapping on all pages. Please wait ▇▇▇▇"
  for i in 0..(municipalities_url.length - 1)
    if i % 46 == 0 && i > 10
      print "\n"
    end
    parser_pages = Nokogiri::HTML(URI.open(municipalities_url[i]))
    emails[i] = parser_pages.xpath('//table/tbody/tr/td[contains(text(), "@")]').map(&:text)
    cities[i] = parser_pages.xpath('//section/div/div/div/h1').map(&:text)
    if i != 184
      print "▇"
    end
  end
  all_cities = cities.map{|name|name.to_s[2..-1].split(' ')[0]}
  # puts all_cities
  concats_infos = Hash[all_cities.zip(emails)]
  puts concats_infos
  concats_infos.each do |index|
    puts ">> #{index}"
    sleep(0.05)
  end
  puts "▇" * 15 + " Scrapping done " + "▇" * 15
  puts ""
  return concats_infos
end