Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get "users/show"

  resources :users do
    member do
      post :enable_multi_factor_authentication, to: 'users/multi_factor_authentication#verify_enable'
      post :disable_multi_factor_authentication, to: 'users/multi_factor_authentication#verify_disabled'
    end
  end
end
