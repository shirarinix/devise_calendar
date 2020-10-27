Rails.application.routes.draw do
  root to: 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :artists, controllers: {
    registrations: 'artists/registrations',
    sessions:      'artists/sessions',
    passwords:     'artists/passwords'
  }

  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :bookmarks, only:[:create, :destroy]

  resources :events
end
