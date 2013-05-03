Programmasaurus::Application.routes.draw do
  resource :cover
  resource :github_authentication

  resources :users
  resources :homographs, only: :show
  resources :synsets, only: :show

  resource :profile

  root to: 'covers#show'
end
