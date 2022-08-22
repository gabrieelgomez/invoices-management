Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :invoices

  resources :async_processes, only: %i[new create]

  root to: 'invoices#index'
end
