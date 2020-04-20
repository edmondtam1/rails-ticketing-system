Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'projects#index'

  get '/register', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :projects, except: [:index]
  get '/projects', to: redirect('/')

  resources :tickets do
    resources :comments, only: [:create, :edit, :update]

    member do
      get '/comments', to: 'tickets#show'
    end
  end

  resources :tags, except: [:show]

  resources :users, only: [:show, :create, :edit, :update]
end
