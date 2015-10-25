Rails.application.routes.draw do
  root 'home#index'

  resource :patrimony, controller: "patrimony", only: [:index,:show]
end
