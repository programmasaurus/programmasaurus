require 'sidekiq/web'
Programmasaurus::Application.routes.draw do
  resource :cover
  resource :github_authentication
  resource :homograph
  resource :wiki_dump, only: :create
  resource :suggestion, only: :create

  resources :lemmas
  resources :users
  resources :words, only: [:create, :destroy]
  resources :vocabularies
  resources :synsets, only: :show

  resource :profile

  root to: 'covers#show'

  mount Sidekiq::Web, at: "/sidekiq"
end
