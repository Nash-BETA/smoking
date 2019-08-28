class StaticController < ApplicationController
  def home
    @stores = Store.all
    @prefectures = Prefecture.all
  end

  def about
  end

  def help
  end
end
