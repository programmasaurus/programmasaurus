Programmasaurus::Application.routes.draw do
  resource :cover
  resource :github_authentication
  resource :homograph

  resources :users
  resources :word_tags, only: :create
  resources :synsets, only: :show

  resource :profile

  root to: 'covers#show'
end
