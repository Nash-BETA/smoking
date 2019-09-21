class StoreController < ApplicationController
  def detail
    @stores   = Store.find(params[:id])
    @reviews  = Review.new
    @users = current_user.id

  end

end