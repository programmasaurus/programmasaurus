Programmasaurus::Application.routes.draw do
  resource :cover
  resource :github_authentication
  resource :homograph
  resource :lemma

  resources :users
  resources :words, only: [:create, :destroy]
  resources :vocabularies, only: [:create, :destroy]
  resources :synsets, only: :show

  resource :profile

  root to: 'covers#show'
end
