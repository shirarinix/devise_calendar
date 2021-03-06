Rails.application.routes.draw do
  root to: 'events#index'
  post 'events/new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    passwords:     'users/passwords'
  }
  devise_for :artists, controllers: {
    registrations: 'artists/registrations',
    sessions:      'artists/sessions',
    passwords:     'artists/passwords'
  }
  resources :events

  resources :bookmarks, only:[:create, :destroy]

  resources :users do
    member do
      get :following, :follower
    end
  end
  resources :artists do
    member do
      get :follow, :followed
    end
  end
end
