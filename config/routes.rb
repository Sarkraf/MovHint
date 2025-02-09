Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:update]
  resource :dashboard, only: [:show], controller: "dashboards" do
    member do
      get "preferences"
    end
  end




  # Defines the root path route ("/")
  # root "posts#index"
  resources :movies, only: [:index, :show], param: :title do
    resources :suggestions, only: [:update]
    resources :preferences, only: [:create, :destroy]
  end

end

  # routes des profiles à déterminer
