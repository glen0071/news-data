Rails.application.routes.draw do

  resources :queries do
    resources :responses 
  end

  root "queries#index"

end
