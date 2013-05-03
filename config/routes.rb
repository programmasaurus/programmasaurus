Programmasaurus::Application.routes.draw do
  resource :cover
  resource :github_authentication
  resource :homograph

  resources :users
  resources :synsets, only: :show

  resource :profile

  root to: 'covers#show'
end
