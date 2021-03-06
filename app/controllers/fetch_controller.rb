class FetchController < ApplicationController

    require 'nokogiri'
    require 'open-uri'
    require 'kconv'    
    require 'fileutils'

    def index

        (26032875..26032975).each do |id|
            begin
            uri = "https://tabelog.com/kyoto/A2601/A260101/#{id}"
                doc = Nokogiri::HTML(open(uri),nil,"utf-8")

                smok = doc.xpath('//*[@id="contents-rstdata"]/div[2]/table[2]/tbody/tr[4]/td/text()').text
                smoking = smok.strip
                    #.stripで空白の削除してる
                    
                if smoking == '喫煙' ||  smoking == '分煙' ||  smoking == '全面喫煙可'
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
                    #.indexを使用することで指定した文字の順番を出せる
                    dinner_aux01        = dinner.index("￥")
                    dinner_aux02        = dinner.index("～￥")
                    #カンマが付いたままなので数字にできない
                    dinner_min_comma    = dinner[dinner_aux01+1,dinner_aux02-1]
                    dinner_max_comma    = dinner[dinner_aux02+2,9]
                    #gsubを使用してカンマを決して.to_iで数字に変化
                    dinner_min          = dinner_min_comma.gsub(/(\d{0,3}),(\d{3})/, '\1\2').to_i
                    dinner_max          = dinner_max_comma.gsub(/(\d{0,3}),(\d{3})/, '\1\2').to_i

                    #画像取得用（jsでスライダーを使われていてスクレイピング上手く回らないので、小さい画像のURL取得してURLを加工する）
                    begin
                        mini_picture        = doc.xpath('//*[@id="column-main"]/div[1]/div[2]/ul/li[1]/a/img').attribute('src').value
                    
                        mini_picture != ""
                        picture_aux01       = mini_picture.index("m/")
                        picture_aux02       = mini_picture.index("/restaurant/")
                        picture_first       = mini_picture[0,picture_aux01+1]
                        picture_last        = mini_picture[picture_aux02,99]
                        image_sum           = "#{picture_first}#{picture_last}"
                        picture_aux03       = image_sum.index("?")
                        image_uri               = image_sum[0,picture_aux03]


                        #画像保存
                        fileName = File.basename("#{nm}"+".jpg")
                        dirName = "public/store/"
                        filePath = dirName + fileName
                        
                        FileUtils.mkdir_p(dirName) unless FileTest.exist?(dirName)
                        
                        open(filePath, 'wb') do |output|
                            open(image_uri) do |data|
                                output.write(data.read)

                            end
                        end
                        image               = "#{nm}.jpg"
                    rescue
                        image               = ""
                    end

                    lunch               = doc.xpath('//*[@id="rstdtl-head"]/div[1]/section/div[2]/div/div/div[2]/dl[1]/dd/div/p[2]/span/a').text
                    if lunch != "-"
                        lunch_aux01         = lunch.index("￥")
                        lunch_aux02         = lunch.index("～￥")
                        #.indexを使用することで指定した文字の順番を出せる
                        lunch_min_comma     = lunch[lunch_aux01+1,lunch_aux02-1]
                        lunch_max_comma     = lunch[lunch_aux02+2,9]
                        #カンマが付いたままなので数字にできない
                        lunch_min           = lunch_min_comma.gsub(/(\d{0,3}),(\d{3})/, '\1\2').to_i
                        lunch_max           = lunch_max_comma.gsub(/(\d{0,3}),(\d{3})/, '\1\2').to_i
                        #gsubを使用してカンマを決して.to_iで数字に変化
                        insert_feed(nm, name_hurigana, smoking,prefecture,city,city_street,genre,business_hours,holi,lunch_min,lunch_max,dinner_min,dinner_max,image)
                    else
                        insert_feed(nm, name_hurigana, smoking,prefecture,city,city_street,genre,business_hours,holi,lunch_min,lunch_max,dinner_min,dinner_max,image)
                    end
                end
                sleep 1
            rescue 
                0
            end
        end
    end
end
    
    private
    def insert_feed(nm, name_hurigana, smoking,prefecture,city,city_street,genre,business_hours,holi,lunch_min,lunch_max,dinner_min,dinner_max,image)
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
            :lunch_min            => lunch_min,
            :lunch_max            => lunch_max,
            :dinner_min           => dinner_min,
            :dinner_max           => dinner_max,
            :image                => image,
            )
        store.save
    end
