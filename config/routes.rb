Bikedb::Application.routes.draw do
  devise_for :users
  root to: "static_pages#home"

  resources :bikes
  resources :volunteers
  resources :clients
end
