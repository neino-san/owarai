Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :user, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    get 'show/:id/', to: 'users/registrations#show'
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: 'users/sessions#destroy'
    get 'show/:id/following', to: 'users/registrations#following', as: 'following'
    get 'show/:id/followers', to: 'users/registrations#followers', as: 'followers'
  end

  resources :posts do
    resources :comments, only: %i[create destroy]
  end

  resources :users, only: %i[show]

  resources :relationships, only: %i[create destroy]
end
