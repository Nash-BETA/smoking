Rails.application.routes.draw do

  get 'seo/robots'
  get 'seo/sitemap'
  root 'static#home'
  post '/signup',  to: 'users#create'
  get '/about',          to: 'static#about'
  get '/static/help',    to: 'static#help'
  get '/pref/:prefcode', to: 'prefecture#show' ,as: 'pref'
  get '/detail/z_:id',   to: 'store#detail', as: 'detail'

  #ユーザーまわり
  resources :users
  get       'users/new'
  get       '/login',   to: 'sessions#new'
  post      '/login',   to: 'sessions#create'  
  delete    '/logout',  to: 'sessions#destroy'


  #口コミまわり
  resources :reviews

  #コントローラーを動かす。（クローリングでfeetchとprefectureで使用）
  get ':controller(/:action(/:id(.:format)))'

end