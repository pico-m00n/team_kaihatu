Rails.application.routes.draw do
  devise_for :admin, skip:[:registrations, :passwords], controllers: {
  sessions:      'admin/sessions',
}
  namespace :admin do
   resources :genres, only: [:index, :edit, :create, :update]
   resources :items, only: [:index, :edit, :new, :show, :create, :update]

  end

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end