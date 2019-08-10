Rails.application.routes.draw do
  root 'static#home'
  get '/about', to: 'static#about'
  get 'static/help'
end
