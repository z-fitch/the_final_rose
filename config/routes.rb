Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bachelorettes, only: [:show] do
    resources :contestants, only: [:index, :show]
    # resources :outings, only: [:show]
  end
  resources :outings, only: [:show] do
    resources :contestants, only: [:destroy], controller: "contestant_outings"
  end
  

end
