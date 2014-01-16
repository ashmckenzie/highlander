Highlander::Application.routes.draw do

  # Redirect leaderboard.hooroo.com -> hooroo.hilander.io
  #
  match '(*foo)' => redirect { |p|
    "http://hooroo.hilander.io/#{p[:foo]}"
  },
  constraints: { host: 'leaderboard.hooroo.com' }, via: [ :get ]

  # Redirect thequickening.herokuapp.com -> www.hilander.io
  #
  match '(*foo)' => redirect { |p|
    "http://hilander.io"
  },
  constraints: { host: 'thequickening.herokuapp.com' }, via: [ :get ]

  namespace :api do

    Metric::NAMES.each do |metric|
      post metric => 'events#create', defaults: { metric: metric }
    end

    resources :events, only: [ :create ]

    namespace :adapters do
      resources :github,  only: [ :create ]
      resources :twitter, only: [ :create ]
    end
  end

  get   '/signout' => 'sessions#destroy', as: :signout
  post  '/auth/google_apps/callback' => 'sessions#create'

  get   '/activity'             => 'activity#index'
  get   '/activity/current'     => 'activity#current'
  get   '/activity/stream'      => 'activity#stream'

  get   '/events/stream'        => 'events#stream'
  get   '/achievements/stream'  => 'achievements#stream'

  # get '/about' => 'high_voltage/pages#show', id: 'about'

  # Rounds under this constraint are for Organisations
  #
  # eg. Hooroo, Agile Aus
  #
  constraints(subdomain: /^(?!www).+$/) do

    resources :users
    resources :badges, only: [ :index, :show ]
    resources :bounties
    get '/stats' => 'stats#index', as: :stats

    root to: 'welcome#index'
  end

  # Routes under this constraint are when no Organisation has been defined,
  # or it's www
  #
  constraints(subdomain: /.*/) do

    resources :registrations, only: [ :index, :create ]

    root to: 'registrations#index', as: 'root_register'
  end
end
