Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/cocktails', to: 'cocktails#index'
  # post '/cocktails', to: 'cocktails#create'
  # get '/cocktails/new', to: 'cocktails#new'
  # get '/cocktails/:id', to: 'cocktails#show', as: :cocktail

  resources :cocktails, only: %i[index create new show destroy] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
  root 'cocktails#index'
end
