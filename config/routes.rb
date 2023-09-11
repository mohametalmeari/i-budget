Rails.application.routes.draw do
  devise_for :users
  resources :groups, path: 'categories' do
    resources :records
  end
  root 'home#index'
end