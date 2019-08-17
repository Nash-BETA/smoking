Rails.application.routes.draw do
  root 'static#home'
  get '/about', to: 'static#about'
  get 'static/help'
  get 'taberogu/index'
  get ':controller(/:action(/:id(.:format)))'
  resource :stores
end
