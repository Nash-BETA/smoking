class FavoritesController < ApplicationController
    def create
        store = store.find(params[:store_id])
        current_user.like(store)
        flash[:success] = 'お気に入り登録をしました。'
    end
    
    def destroy
        store = store.find(params[:store_id])
        current_user.unlike(store)
        flash[:success] = 'お気に入り登録を解除しました。'
    end
end