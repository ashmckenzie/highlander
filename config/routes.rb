Highlander::Application.routes.draw do

  namespace :api do

    Metric::NAMES.each do |metric|
      post metric => 'events#create', :defaults => { metric: metric }
    end

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

  resources :users
  resources :badges, only: [ :index, :show ]
  resources :bounties

  get '/about' => 'high_voltage/pages#show', id: 'about'

  root to: 'welcome#index'

end
