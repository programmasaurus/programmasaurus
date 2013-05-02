Programmasaurus::Application.routes.draw do
  resources :users
  resources :homographs, only: :show, key: :word

  root to: 'users#show'
end
