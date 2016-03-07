Rails.application.routes.draw do

  resources :queries

  resources :responses 

  root "queries#index"

end
