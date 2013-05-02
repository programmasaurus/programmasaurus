Programmasaurus::Application.routes.draw do
  resources :users
  resources :homographs, only: :show, key: :word
  resources :synsets, only: :show

  root to: 'users#show'
end
