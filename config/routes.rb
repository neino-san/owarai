Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :user, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  devise_scope :user do
    get 'show/:id/' => 'users/registrations#show'
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
    get 'show/:id/following', to: 'users/registrations#following', as: 'following'
    get 'ahow/:id/followers', to: 'users/registrations#followers', as: 'followers'
  end
  
  resources :posts
  
  resources :users do
    collection do
      get :show
    end
  end
  
  resources :relationships, only: [:create, :destroy]
end
