class TaberoguController < ApplicationController
    require "open-uri"
    require "nokogiri"
    
    def index
        url = "https://tabelog.com/kanagawa/A1401/A140105/14000514/dtlrvwlst/B266442454/"
      @doc = Nokogiri::HTML(open(url),nil,"utf-8")
    end
   end

