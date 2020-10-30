require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index', as: 'root'

  resources :departments do
    resources :plans
  end

  resources :plans do
    resources :flow_steps
  end

  resources :flow_steps do
    resources :tasks
  end

  resources :tasks

  resources :tasks do
    resources :task_states
  end

  devise_for :users, controllers: { invitations: 'users/invitations' }

  resources :users
end

