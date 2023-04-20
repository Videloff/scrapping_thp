require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

crypto_names = page.xpath('//td[contains(@class, "by__symbol")]').map(&:text)
crypto_prices = page.xpath('//td[contains(@class, "by__price")]').map(&:text)


crypto = Hash[crypto_names.zip(crypto_prices)]
crypto.each{|key, value| puts "#{key}: #{value}"}