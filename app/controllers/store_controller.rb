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

      #お気に入り追加
      def like(store)
        favorites.find_or_create_by(store_id: store.id)
    end

    #お気に入り削除
    def unlike(store)
        favorite = Favorite.find_by(store_id: store.id)
        favorite.destroy if favorite
    end
    
    #登録判定
    def  favpost(store)
        self.fav_posts.include?(store)
    end
end