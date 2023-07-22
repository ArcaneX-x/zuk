Rails.application.routes.draw do
  root "catalogues#index"
  resources :catalogues
end
