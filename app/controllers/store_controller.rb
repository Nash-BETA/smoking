class StoreController < ApplicationController
  def detail
    @stores          = Store.find(params[:id])
    @reviews         = Review.new
    if logged_in?
      @users           = current_user.id
    end

    
    st              = detail_path[10,10].to_i
    review_store    = Review.where(store_id: "#{st}")
    @review_display = review_store
    @user_review    = User.all

  end

end