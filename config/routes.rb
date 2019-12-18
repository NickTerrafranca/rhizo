Rails.application.routes.draw do
  resource :users
  get  '/signup',  to: 'users#new'
end
