require 'nokogiri'
require 'open-uri'
require 'csv'

CSV.open("taberogu.csv", "w") do |csv|

    id = 'id'
    name = 'name'
    name_hurigana = 'hurigana'
    smoking = 'smoking'
    csv << [id,name, name_hurigana,smoking]

    (14000513..14000514).each do |no|

        uri = "https://tabelog.com/kanagawa/A1401/A140105/#{no}"
        doc = Nokogiri::HTML(open(uri),nil,"utf-8")

        id = "#{no}".to_i - 14000512
        name = doc.css("h2.display-name").text
        name_hurigana = doc.css("span.alias").text
        smoking = doc.xpath('//*[@id="contents-rstdata"]/div[2]/table[2]/tbody/tr[4]/td/text()').text
        csv << [id,name, name_hurigana,smoking] 
    end
end
