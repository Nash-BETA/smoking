class StoreController < ApplicationController
  def detail
    @stores = Store.find(params[:id])

  end
end
