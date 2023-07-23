Rails.application.routes.draw do
  root "catalogues#index"
  resources :catalogues
  resources :reset_passwords, only: [:new, :create, :edit, :update]
end
