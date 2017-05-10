Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'restaurants#index'

  resources :restaurants, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:create]
    collection do
      get 'search' => 'restaurants#search'
    end
  end

end
