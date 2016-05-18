Rails.application.routes.draw do

  devise_for :users

  resources :notes

  authenticated :user do
    root 'notes#index', as: :authenticated_root
  end
  root 'welcomes#index'

end
