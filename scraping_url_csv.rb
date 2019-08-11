require 'nokogiri'
require 'open-uri'
require 'csv'

CSV.open("taberogu.csv", "w") do |csv|

    (14000513..14000514).each do |id|

        uri = "https://tabelog.com/kanagawa/A1401/A140105/#{id}"
        doc = Nokogiri::HTML(open(uri),nil,"utf-8")

        name = doc.css("h2.display-name").text
        name_hurigana = doc.css("span.alias").text
        smoking = doc.xpath('//*[@id="contents-rstdata"]/div[2]/table[2]/tbody/tr[4]/td/text()').text
        csv << [name, name_hurigana,smoking] 
    end
end
