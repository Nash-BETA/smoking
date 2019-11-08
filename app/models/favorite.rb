class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :store




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
    def  favpost?(store)
        self.fav_posts.include?(store)
    end
end
