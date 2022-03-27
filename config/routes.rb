Rails.application.routes.draw do

#namespaceだと上手く作動しない
  resources :genres, only: [:show]
  resources :orders
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete 'cart_items' => 'cart_items#all_destroy', as: 'all_destroy'
  resources :orders, only: [:create, :new, :index, :show ,]
  resources :shipping_addresses, only: [:index, :create, :destroy, :edit, :update]
  resource :customers, only: [:show, :edit, :update]
  patch 'customers/quit' => 'customers#out', as: 'out'
  root to: "homes#top"
  resources :items, only: [:show, :index]
  get "home/about"=>"homes#about"
  get "order/about" => "orders#about"
  get "order/complete" => "orders#complete"

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

#ふっちー
  devise_for :admins, skip:[:registrations, :passwords], controllers: {
  sessions:      'admins/sessions',
}


  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    #ふっちー
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :edit, :new, :show, :create, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
