Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#show'
  # get 'home', to: 'pages#about'
  get "/api/v1/pronostic", to: 'pages#api'
end
