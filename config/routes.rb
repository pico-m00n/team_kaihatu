Rails.application.routes.draw do

  root to: "homes#top"
  resource :customers, only: [:show, :edit, :update]
  resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}


namespace :customers do
  resources :orders
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete 'cart_items' => 'cart_items#all_destroy', as: 'all_destroy'
  resources :orders, only: [:create, :new, :index, :show]
  resources :shipping_addresses, only: [:index, :create, :destroy, :edit, :update]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
