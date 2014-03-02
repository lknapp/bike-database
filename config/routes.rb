Bikedb::Application.routes.draw do
  root "static_pages#home"
  resources :bikes
end
