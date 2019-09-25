require 'nokogiri'
require 'open-uri'
require 'kconv'   

https://tblg.k-img.com/restaurant/images/Rvw/114996/114996399.jpg
https://tblg.k-img.com/resize/660x370c/restaurant/images/Rvw/114873/114873025.jpg

        uri = "https://tabelog.com/kyoto/A2601/A260101/26020800/"
        doc = Nokogiri::HTML(open(uri),nil,"utf-8")



        name_hurigana = doc.css("span.alias").text
        puts name_hurigana


        smoking = doc.xpath('//*[@id="contents-rstdata"]/div[2]/table[2]/tbody/tr[4]/td/text()').text
        puts smoking

