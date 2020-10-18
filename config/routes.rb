Rails.application.routes.draw do
  root to: 'events#index'
  resources :events

  resources :users, only: [:show, :edit, :update] do
    get :users_artists, on: :collection
  end
  resources :artists, expect: [:index] do
    resource :users_artists, only: [:create, :destroy]
  end
  
  devise_for :artists, controllers: {
    sessions:      'artists/sessions',
    passwords:     'artists/passwords',
    registrations: 'artists/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
