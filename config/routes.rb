Rails.application.routes.draw do
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show] 
  end  
  root 'users#index'
end
