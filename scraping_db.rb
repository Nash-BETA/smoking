require 'nokogiri'
require 'open-uri'



        uri = "https://tabelog.com/kanagawa/A1401/A140105/14000514"
        doc = Nokogiri::HTML(open(uri),nil,"utf-8")

        name = doc.css("h2.display-name").text
        name_hurigana = doc.css("span.alias").text
        smoking = doc.xpath('//*[@id="contents-rstdata"]/div[2]/table[2]/tbody/tr[4]/td/text()').text
        insert_store(name, name_hurigana, smoking)
        private
    

    def insert_store(name, name_hurigana, smoking)
        stores = Feed.new(
            :name             => name,
            :name_hurigana    => name_hurigana,
            :smoking          => smoking,
            )
        stores.save
    end


