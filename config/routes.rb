Programmasaurus::Application.routes.draw do
  resource :cover
  resource :github_authentication

  resources :users
  resources :homographs, only: :show, key: :word
  resources :synsets, only: :show

  root to: 'covers#show'
end
