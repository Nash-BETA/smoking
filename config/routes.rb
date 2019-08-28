Rails.application.routes.draw do

  get '/detail/z_:id', to: 'store#detail'
  root 'static#home'
  get '/about', to: 'static#about'
  get 'static/help'
  get '/pref/:prefcode', to: 'prefecture#show'
  #/1で北海道ページに飛ぶ
  get ':controller(/:action(/:id(.:format)))'
  
end
