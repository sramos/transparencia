Rails.application.routes.draw do
  root 'home#index'

  resource :patrimony, controller: "patrimony", only: [:index,:show]

  resources :areas, only: [:index] do
    resources :departments, only: [:index]  
  end
  resources :departments, only: [:show]
  resources :objectives, only: [:show, :edit, :update]

  get "designs/enquiry_index", to: "designs#enquiry_index"
  get "designs/enquiry_form", to: "designs#enquiry_form"
  get "designs/enquiry_show", to: "designs#enquiry_show"
end
