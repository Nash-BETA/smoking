class SitemapsController < ApplicationController

    def index
        @domain      = "#{request.protocol}#{request.host}"
        @stores      = Store.all
        @prefectures = Prefecture.all
    end
end
