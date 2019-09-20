class StoreController < ApplicationController
  def detail
    @stores   = Store.find(params[:id])
    @reviews  = Review.new
    @users    = User.find(params[:id])
  end

end