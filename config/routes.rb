Rails.application.routes.draw do
  devise_for :users 

  devise_scope :user do
    root "posts#index"
    resources :posts
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "devise/sessions#new", as: :unauthenticated_root
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
end
