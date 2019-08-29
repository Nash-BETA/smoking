class FetchController < ApplicationController

    require 'nokogiri'
    require 'open-uri'
    require 'kconv'    

    def index

        uri = "https://tabelog.com/kanagawa/A1401/A140105/14000518"
        doc = Nokogiri::HTML(open(uri),nil,"utf-8")

        nm = doc.css("h2.display-name").text
        name = nm.strip
        name_hurigana = doc.css("span.alias").text
        smok = doc.xpath('//*[@id="contents-rstdata"]/div[2]/table[2]/tbody/tr[4]/td/text()').text
        smoking = smok.strip
        prefecture = doc.xpath('//*[@id="contents-rstdata"]/div[2]/table[1]/tbody/tr[5]/td/p/span[1]/a').text
        city = doc.xpath('//*[@id="contents-rstdata"]/div[2]/table[1]/tbody/tr[5]/td/p/span[2]/a[1]').text



        insert_feed(name, name_hurigana, smoking,prefecture,city)
    end
end
    
    private
    def insert_feed(name, name_hurigana, smoking,prefecture,city)
        store = Store.new(
            :name             => name,
            :name_hurigana    => name_hurigana,
            :smoking          => smoking,
            :prefecture       => prefecture,
            :city             => city,
            )
        store.save
    end
