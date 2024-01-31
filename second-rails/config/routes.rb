Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/index" => 'home#index'
  get "/write" => 'home#write'
  post '/create' => 'home#create'

  get '/modify/:post_id' => 'home#modify'
  post '/update/:post_id' => 'home#update'
  get '/delete/:post_id' => 'home#delete'

end
