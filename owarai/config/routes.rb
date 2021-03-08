Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  root 'static_pages#home'
  devise_for :user, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    get 'show/:id/' => 'users/registrations#show'
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: 'users/sessions#destroy'
    get 'show/:id/following', to: 'users/registrations#following', as: 'following'
    get 'show/:id/followers', to: 'users/registrations#followers', as: 'followers'
  end

  resources :posts do
    resources :comments, only: %i[create destroy]
  end

  resources :users do
    collection do
      get :show
    end
  end

  resources :relationships, only: %i[create destroy]
end
