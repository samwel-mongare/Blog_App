Rails.application.routes.draw do
  resources :users, only: %i[index new show] do
    resources :posts, only: %i[index new show] 
  end  
  root 'users#index'
end
