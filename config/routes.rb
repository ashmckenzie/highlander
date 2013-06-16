Highlander::Application.routes.draw do

  match '(*foo)' => redirect { |p|
    "http://hooroo.hilander.io/#{p[:foo]}"
  },
  constraints: { host: 'leaderboard.hooroo.com' }, via: [ :get ]

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

  get   '/signout' => 'sessions#destroy', as: :signout
  post  '/auth/google_apps/callback' => 'sessions#create'

  constraints(:subdomain => /.+/) do

    resources :users
    resources :badges, only: [ :index, :show ]
    resources :bounties

    get '/about' => 'high_voltage/pages#show', id: 'about'

    root to: 'welcome#index'
  end

  constraints(:subdomain => /.*/) do

    resources :registrations, only: [ :index, :create ]

    root to: 'registrations#index', as: 'root_register'
  end
end
