class StoreController < ApplicationController
  def detail
    @stores = Store.find(params[:id])
    @reviews = Review.all
  end
end
