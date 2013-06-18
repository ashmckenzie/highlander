Highlander::Application.routes.draw do

  namespace :api do

    Metric::NAMES.each do |metric|
      post metric => 'events#create', :defaults => { metric: metric }
    end

    resources :events, only: [ :create ]

    namespace :adapters do
      resources :twitter, only: [ :create ]
    end
  end

  resources :users
  resources :badges, only: [ :index, :show ]

  get '/about' => 'high_voltage/pages#show', id: 'about'

  root to: 'welcome#index'

end
