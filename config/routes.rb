Rails.application.routes.draw do
  resources :items, only: [:index] 


  resources :users, only: [:index, :show] do
    # we want to show all the items associated with the individual user
    resources :items, only: [:index, :show, :create]
  end
end
