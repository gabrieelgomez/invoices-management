Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :invoices

  resources :bulk_uploads, only: %i[new create]

  root to: 'invoices#index'
end
