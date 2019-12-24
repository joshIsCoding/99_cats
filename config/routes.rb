Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats
  resources :cat_rental_requests, only: [:new, :create, :show] do
    member do 
      patch 'approve'
      patch 'deny'
    end
  end

  resources :users, only: [:new, :create]
  # only one session needed as each user can only have one
  resource :session, only: [:new, :create, :destroy]
end
