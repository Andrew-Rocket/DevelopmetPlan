Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users

  resources :departments do
    resources :plans
  end

  post 'users/invite', to: 'users#invite', as: 'user_invite'
end

