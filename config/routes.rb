Rails.application.routes.draw do
  resources :users, shallow: true do
    resources :posts
  end  

  root 'home#index'
end
