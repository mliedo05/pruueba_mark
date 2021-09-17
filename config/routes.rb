Rails.application.routes.draw do
  resources :types
  resources :markers
  resources :subcategories
  resources :categories
  get "/api/categories", to: "categories#categories_api"
  root "categories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
