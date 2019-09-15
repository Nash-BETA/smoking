Rails.application.routes.draw do

  get 'users/new'
  root 'static#home'
  resources :users
  get '/about',          to: 'static#about'
  get '/static/help',    to: 'static#help'
  get '/pref/:prefcode', to: 'prefecture#show'
  get '/detail/z_:id',   to: 'store#detail', as: 'detail'
  #asでPrefix の設定ができる
  get ':controller(/:action(/:id(.:format)))'

end