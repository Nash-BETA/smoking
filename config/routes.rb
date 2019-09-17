Rails.application.routes.draw do

  root 'static#home'
  resources :users
  post '/signup',  to: 'users#create'
  get 'users/new'
  get '/about',          to: 'static#about'
  get '/static/help',    to: 'static#help'
  get '/pref/:prefcode', to: 'prefecture#show'

  #asでPrefix の設定ができる
  get '/detail/z_:id',   to: 'store#detail', as: 'detail'

  #ログイン機能
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  #コントローラーを動かす。（クローリングでfeetchとprefectureで使用）
  get ':controller(/:action(/:id(.:format)))'

end