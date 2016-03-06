Rails.application.routes.draw do

  resources :queries

  post '/queries' => 'queries#create'
  get '/' => 'queries#new'

end
