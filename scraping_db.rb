require 'nokogiri'
require 'open-uri'

    (14000513..14000514).each do |no|

        uri = "https://tabelog.com/kanagawa/A1401/A140105/#{no}"
        doc = Nokogiri::HTML(open(uri),nil,"utf-8")

        name = doc.css("h2.display-name").text
        name_hurigana = doc.css("span.alias").text
        smoking = doc.xpath('//*[@id="contents-rstdata"]/div[2]/table[2]/tbody/tr[4]/td/text()').text
        insert_feed(name, name_hurigana, smoking)
    end

    private
    def insert_feed(name, name_hurigana, smoking)
      feed = store.new(
        :name             => name,
        :name_hurigana    => name_hurigana,
        :smoking          => smoking,
      )
      feed.save
    end
