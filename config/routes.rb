require 'sidekiq/web'

Bikedb::Application.routes.draw do
  devise_for :users
  root to: "static_pages#home"

  mount Sidekiq::Web => '/sidekiq'

  resources :bikes, except: [:show, :destroy] do
    get 'search' => 'bikes#search', on: :collection
    get 'print_select' => 'bikes#print_select', on: :collection
    get 'print_labels' => 'bikes#print_labels', on: :collection
    get 'freecyclery_pickup' => 'bikes#freecyclery_pickup', on: :collection
    patch 'mark_as_sold' => 'bikes#mark_as_sold', on: :member
  end

  resources :volunteers
  resources :agencies
  resources :clients do
    get 'receipt' => 'freecyclery#receipt'
    get 'print_select' => 'clients#print_select', on: :collection
    get 'print_receipts' => 'clients#print_receipts', on: :collection
  end

  get 'bikes_by_location' => 'static_pages#bikes_by_location'
  get 'sale_bikes' => 'static_pages#sale_bikes'
  get 'closed_applications' => 'freecyclery#closed_applications'
  get 'voided_applications' => 'freecyclery#voided_applications'
  get 'available_bikes' => 'freecyclery#available_bikes'
  get 'bikes_sold_per_year' => 'reports#bikes_sold_per_year'
  get 'bikes_fixed_per_week' => 'reports#bikes_fixed_per_week'
end
