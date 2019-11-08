class FavoritesController < ApplicationController
    def create
        store = Store.find(params[:store_id])
        current_user.like(store)
        flash[:success] = 'お気に入り登録をしました。'
        redirect_back(fallback_location: root_path)        
    end
    
    def destroy
        store = Store.find(params[:store_id])
        current_user.unlike(store)
        flash[:success] = 'お気に入り登録を解除しました。'
        redirect_back(fallback_location: root_path)
    end
end