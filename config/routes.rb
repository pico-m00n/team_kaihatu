Rails.application.routes.draw do
 
  root to: 'customers#show'
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
