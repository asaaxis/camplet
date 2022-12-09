Rails.application.routes.draw do
  root 'users#show'

  resources :labels
  resources :teams do
    resources :assigns, only: %i[ create destroy ]
    resources :travel_plans
  end

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
