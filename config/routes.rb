Rails.application.routes.draw do
  get 'home/index'
  # get 'production_companies/index'
  # get 'production_companies/show'
  #get 'movies/index'
  #get 'movies/show'
  resources :movies, only: [:index, :show]
  resources :production_companies, only: [:index, :show]

  #default route to website aka home page route
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
