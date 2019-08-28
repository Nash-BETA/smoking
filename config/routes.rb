Rails.application.routes.draw do

  root 'static#home'
  get '/about',          to: 'static#about'
  get '/static/help',    to: 'static#help'
  get '/pref/:prefcode', to: 'prefecture#show'
  #/1で北海道ページに飛ぶ
  get '/detail/z_:id',   to: 'store#detail'

  #get ':controller(/:action(/:id(.:format)))'
  #controllerアクション
  #/fetch でお店のクローリング　/prefectureで都道府県のクローリング  
  get '/prefecture', to: 'prefecture#index'
  get '/fetch' , to: 'fetch#index'
end