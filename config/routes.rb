Bikedb::Application.routes.draw do
  devise_for :users
  root to: "static_pages#home"

  resources :bikes do
    get 'print_select' => 'bikes#print_select', on: :collection
    get 'print_labels' => 'bikes#print_labels', on: :collection
    patch 'mark_as_sold' => 'bikes#mark_as_sold', on: :member
  end

  resources :volunteers
  resources :agencies
  resources :clients
end
