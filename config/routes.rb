Rails.application.routes.draw do
  root 'home#index'

  resources :patrimony, only: [:index]
  namespace :patrimony do
    resources :buildings, :renting_buildings
  end

  resources :areas, only: [:index] do
    resources :departments, only: [:index]  
  end
  resources :departments, only: [:show]
  resources :objectives, only: [:show, :edit, :update]

  get "designs/enquiry_index", to: "designs#enquiry_index"
  get "designs/enquiry_form", to: "designs#enquiry_form"
  get "designs/enquiry_show", to: "designs#enquiry_show"
end
