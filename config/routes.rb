Rails.application.routes.draw do

  #product
  get '/product_list', to: 'products#product_list'
  post '/create_product', to: 'products#create'
  
  #user
  post '/create_user', to: 'users#create'
  get '/user_list', to: 'users#index'
  
  #country
  get 'countries_list', to: 'countries#countries_list'
end
