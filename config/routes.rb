Rails.application.routes.draw do
  root 'marketing#home'
  get 'marketing/about'
  get 'marketing/contact'
  get 'marketing/sign_in'
  get 'marketing/sign_up'

  devise_for :buyers, :controllers => { :registrations => "buyers/registrations",
                                        :sessions => "buyers/sessions" }
  devise_for :farmers, :controllers => { :registrations => "farmers/registrations",
                                        :sessions => "farmers/sessions" }

  resources :farmer_products
  resources :orders
  resources :products
  resources :inventories
  resources :farm_locations

  get 'farmer_app/locations', to: 'farm_locations#index'
  get 'farmer_app/location_search', to: 'farm_locations#location_search'
  get 'farmer_app/orders', to: 'orders#index'
  get 'farmer_app/inventories', to: 'inventories#index'
  get 'farmer_app/farmer_products', to: 'farmer_products#index'

  get 'buyer_app/orders', to: 'orders#index'
  get 'buyer_app/farms', to: 'buyers/buyers#index_farms'
  get 'buyer_app/show_farmer/:id', to: 'buyers/buyers#show_farmer'
  get 'buyer_app/buyer_location', to: 'buyers/buyers#buyer_location'
  get 'buyer_app/set_buyer_location', to: 'buyers/buyers#set_buyer_location'


  # get 'buyer_app/find_a_farm', to: 'buyer_app/find_a_farm'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
