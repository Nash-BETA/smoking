class StoreController < ApplicationController
  def detail
    store = Store.find(params[:id])

  end
end
