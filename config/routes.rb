Rails.application.routes.draw do
　root to: 'customers#show'
  get "home/about"=>"homes#about"
  patch 'customers/quit' => 'customers#out', as: 'out'
  resource :customers, only: [:show, :edit, :update]
  resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :orders, only: [:index, :show]

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


#会員側のルーティング
  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    get 'orders/show' => 'orders#show'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
