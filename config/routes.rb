Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'user/edit' => 'user#edit'

  patch 'user/update' => 'user#update'

  #get 'user/:id' => 'user#show', as: 'user_path'

  resources :user
end
