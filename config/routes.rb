Rails.application.routes.draw do
  root to: 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :artists, controllers: {
    registrations: 'artists/registrations',
    sessions:      'artists/sessions',
    passwords:     'artists/passwords'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  # resources :events
end
