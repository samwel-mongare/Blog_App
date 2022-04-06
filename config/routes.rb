Rails.application.routes.draw do
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
