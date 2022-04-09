Rails.application.routes.draw do

  namespace :api , defaults: { format: :json } do
    namespace :v1 do
      post 'users/sign_up' => 'users#register'
      post 'users/sign_in' => 'users#login'
      get 'posts' => 'posts#index'
      get 'comments' => 'comments#index'
      post 'comments/create' => 'comments#create'
    end
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  resources :users, only: %i[index show] do
    resources :posts, only: %i[show index create new] do
      resources :comments, only: %i[create new]
      resources :likes, only: %i[create]
      end 
  end  
  root 'users#index'
end
