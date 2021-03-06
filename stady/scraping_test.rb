
    require 'nokogiri'
    require 'open-uri'
    require 'kconv'    

        uri = "https://tabelog.com/kyoto/A2601/A260101/26032878"
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
            dinner_aux01          = dinner.index("￥")
            dinner_aux02        = dinner.index("～￥")
            #.indexを使用することで指定した文字の順番を出せる
            dinner_min_comma              = dinner[dinner_aux01+1,dinner_aux02-1]
            dinner_max_comma              = dinner[dinner_aux02+2,9]
            #カンマが付いたままなので数字にできない
            dinner_min          = dinner_min_comma.gsub(/(\d{0,3}),(\d{3})/, '\1\2').to_i
            dinner_max          = dinner_max_comma.gsub(/(\d{0,3}),(\d{3})/, '\1\2').to_i
            #

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
            end
        end
        puts dinner_min
        puts lunch
