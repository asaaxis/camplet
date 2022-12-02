Rails.application.routes.draw do

  resources :teams
  root 'users#show'

  resources :gears do
    collection do
      get 'search'
    end
  end
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
