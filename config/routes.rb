Highlander::Application.routes.draw do

  namespace :api do
    resources :events, only: [ :create ]

    namespace :adapters do
      resources :github,  only: [ :create ]
      resources :twitter, only: [ :create ]
    end
  end

  namespace :admin do
  end

  resources :users, only: [ :index, :show ]

  root to: 'welcome#index'

end
