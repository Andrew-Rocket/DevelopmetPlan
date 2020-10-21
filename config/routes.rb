Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'users/edit' => 'users#edit'

  patch 'users/update' => 'users#update'

  #get 'users/:id' => 'users#show', as: 'user_path'

  resources :user
  resources :departments
end
