require 'nokogiri'
require 'open-uri'

uri = "http://shgam.hatenadiary.jp"
doc = Nokogiri::HTML(open(uri),nil,"utf-8")


#<h1 class="entry-title">の場合
doc.css("h1.entry-title").each do |title|
    puts title.text
end