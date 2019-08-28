require 'net/http'
require 'uri'
require 'json' 



uri = URI.parse('ttps://opendata.resas-portal.go.jp/api/v1-rc.1/prefectures')

https = Net::HTTP.new(uri.host, uri.port)
https.use_ssl = true

param = {}
param['X-API-KEY'] = 'ChHeCpasyo0ZD74UeX8R3cgHId6KFScQ2tFFWcQN'

req = Net::HTTP::Get.new(uri.request_uri, param)
res = https.request(req)

json = res.body
result = JSON.parse(json)

result["result"].each do |val|
    puts val["prefCode"]
    puts val["prefName"]
end
