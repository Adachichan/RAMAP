Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :mystores, only: %i(index show new create edit update) do
    resources :menus
  end

  resources :stores, only: [] do
    resources :reviews, only: %i(index show new create)
  end

  resources :reviews, only: [] do
    resources :comments, only: %i(create)
    resource :favorites, only: %i(create destroy)
    collection do
      get :history
    end
  end
end
