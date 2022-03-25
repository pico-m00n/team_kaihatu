Rails.application.routes.draw do

  scope module: 'customers' do
    root to: "homes#top"
    resources :items, only: [:show, :index]
  end

  get "home/about"=>"homes#about"


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
    resources :genres, only: [:show]
    resources :orders
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items' => 'cart_items#all_destroy', as: 'all_destroy'
    resources :orders, only: [:create, :new, :index, :show]
    resources :shipping_addresses, only: [:index, :create, :destroy, :edit, :update]
    resource :customers, only: [:show, :edit, :update]
    patch 'customers/quit' => 'customers#out', as: 'out'
  end


#会員側のルーティング
  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    get 'orders/show' => 'orders#show'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
