class PrefectureController < ApplicationController

    def show
        @prefecture = Prefecture.find(params[:prefcode])
    end


    def index
    require 'net/http'
    require 'uri'
    require 'json' 
    
    uri = URI.parse('https://opendata.resas-portal.go.jp/api/v1-rc.1/prefectures')
    
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    
    param = {}
    param['X-API-KEY'] = 'ChHeCpasyo0ZD74UeX8R3cgHId6KFScQ2tFFWcQN'
    
    req = Net::HTTP::Get.new(uri.request_uri, param)
    res = https.request(req)
    
    json = res.body
    result = JSON.parse(json)
    
    
    result["result"].each do |val|
        prefcode = val["prefCode"]
        prefname = val["prefName"]
        insert_feed(prefcode, prefname)
    end
    end
    
    private
    def insert_feed(prefcode, prefname)
        prefecture = Prefecture.new(
            :prefcode         => prefcode,
            :prefname         => prefname,
            )
        prefecture.save
    end













end
