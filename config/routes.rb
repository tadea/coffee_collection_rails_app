Rails.application.routes.draw do

  root 'sessions#home'
  get '/signup' => 'users#new'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'

  resources :users do
    resources :coffees, only: [:index]
  end

  resources :coffees do
    resources :reviews
  end

  resources :reviews do
    resources :coffee
  end

  resources :sessions, only: [:new, :create, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
