require 'nokogiri'
require 'open-uri'


    (14000513..14000514).each do |id|

        uri = "https://tabelog.com/kanagawa/A1401/A140105/#{id}"
        doc = Nokogiri::HTML(open(uri),nil,"utf-8")

        doc.css("h2.display-name").each do |name|
            puts name.text
        end
        doc.css("span.alias").each do |name_hurigana|
            puts name_hurigana.text
        end
        doc.xpath('//*[@id="contents-rstdata"]/div[2]/table[2]/tbody/tr[4]/td/text()').each do |smoking|
            puts smoking.text
        end
    end



