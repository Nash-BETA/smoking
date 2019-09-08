class FetchController < ApplicationController

    require 'nokogiri'
    require 'open-uri'
    require 'kconv'    

    def index

        uri = "https://tabelog.com/kanagawa/A1401/A140105/14000518"
        doc = Nokogiri::HTML(open(uri),nil,"utf-8")

        smok = doc.xpath('//*[@id="contents-rstdata"]/div[2]/table[2]/tbody/tr[4]/td/text()').text
        smoking = smok.strip
            #.stripで空白の削除してる
            
        if smoking == '喫煙' ||  smoking == '分煙'
            name                = doc.css("h2.display-name").text
            nm                  = name.strip
            #.stripで空白の削除してる
            name_hurigana       = doc.css("span.alias").text
            prefecture          = doc.xpath('//*[@id="contents-rstdata"]/div[2]/table[1]/tbody/tr[5]/td/p/span[1]/a').text
            city                = doc.xpath('//*[@id="contents-rstdata"]/div[2]/table[1]/tbody/tr[5]/td/p/span[2]/a[1]').text
            city_street         = doc.xpath('//*[@id="contents-rstdata"]/div[2]/table[1]/tbody/tr[5]/td/p/span[2]').text
            genre               = doc.xpath('//*[@id="rstdtl-head"]/div[1]/section/div[2]/div/div/div[1]/dl[2]/dd/div[1]/div[1]/a/span').text
            business_hours      = doc.xpath('//*[@id="contents-rstdata"]/div[2]/table[1]/tbody/tr[7]/td/p[2]').text
            holiday             = doc.xpath('//*[@id="short-comment"]').text
            holi                = holiday.strip
            dinner              = doc.xpath('//*[@id="rstdtl-head"]/div[1]/section/div[2]/div/div/div[2]/dl[1]/dd/div/p[1]/span/a').text
            lunch               = doc.xpath('//*[@id="rstdtl-head"]/div[1]/section/div[2]/div/div/div[2]/dl[1]/dd/div/p[2]/span/a').text
            insert_feed(nm, name_hurigana, smoking,prefecture,city,city_street,genre,business_hours,holi,dinner,lunch)
        end
    end
end
    
    private
    def insert_feed(nm, name_hurigana, smoking,prefecture,city,city_street,genre,business_hours,holi,dinner,lunch)
        store = Store.new(
            :name             => nm,
            :name_hurigana    => name_hurigana,
            :smoking          => smoking,
            :prefecture       => prefecture,
            :city             => city,
            :city_street      => city_street,
            :genre            => genre,
            :business_hours   => business_hours,
            :holiday          => holi,
            :dinner           => dinner,
            :lunch            => lunch,
            )
        store.save
    end
