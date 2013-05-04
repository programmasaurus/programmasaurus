Programmasaurus::Application.routes.draw do
  resource :cover
  resource :github_authentication
  resource :homograph

  resources :lemmas
  resources :users
  resources :words, only: [:create, :destroy]
  resources :vocabularies
  resources :synsets, only: :show

  resource :profile

  root to: 'covers#show'
end
