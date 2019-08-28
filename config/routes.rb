Rails.application.routes.draw do

  get 'store/detail'
  root 'static#home'
  get '/about', to: 'static#about'
  get 'static/help'
  get '/:prefcode', to: 'prefecture#show'
  get ':controller(/:action(/:id(.:format)))'
  
end
