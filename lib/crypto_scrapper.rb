require 'rubygems'
require 'nokogiri'
require 'open-uri'  

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   

symbol_content = []

page.xpath("//td[@class='cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol']").each do |symbol| symbol_content.push(symbol.text) end



prices = []

page.xpath("//td[@class='cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price']").each do |price| prices.push(price.text) end
    

hachage_result = symbol_content.zip(prices).to_h

puts hachage_result