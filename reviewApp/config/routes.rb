Rails.application.routes.draw do
  resources :reviews
  resources :profiles
  get 'static_pages/home'
  root 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/product'
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
