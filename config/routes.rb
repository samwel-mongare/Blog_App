Rails.application.routes.draw do
  resources :users, only: %i[index new show] do
    resources :posts, only: %i[index new show] do
      resources :comments, only: %i[new]
      resources :likes, only: %i[new]
    end
  end  
  root 'users#index'
end
