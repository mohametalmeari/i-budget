Rails.application.routes.draw do
  resources :groups do
    resources :records 
  end
  devise_for :users
  root "home#index"
end
