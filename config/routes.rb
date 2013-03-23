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

  get   '/signout' => 'sessions#destroy', as: :signout
  post  '/auth/google_apps/callback' => 'sessions#create'

  resources :users, only: [ :index, :show, :edit ]

  root to: 'welcome#index'

end
