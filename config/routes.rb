Programmasaurus::Application.routes.draw do
  resources :users

  root to: 'users#show'
end
