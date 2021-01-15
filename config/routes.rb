Rails.application.routes.draw do
  get 'users/show'
  root 'static_pages#home'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  resources :users, :only => [:show]
  
  get "posts/:id" => "posts#show"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  post "posts/create" => "posts#create"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
