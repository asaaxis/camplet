Rails.application.routes.draw do
  root 'top#index'

  resources :labels
  resources :teams do
    resources :assigns, only: %i[ create destroy ]
    resources :travel_plans, shallow: true do
      resources :chats
    end
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

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
