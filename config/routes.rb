Rails.application.routes.draw do

  #---------------------------------------------------------------------------------------
  # public routes

  # guest_sign_in
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # URL：/users/sign_in
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do

    root to: 'homes#top'
    get 'search', to: 'homes#search', as: 'search'
    get 'users/mypage', to: 'users#show', as: 'mypage'
    get 'users/information/edit', to: 'users#edit', as: 'edit_information'
    patch 'users/information', to: 'users#update', as: 'update_information'
    get 'users/unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/withdraw', to: 'users#withdraw', as: 'withdraw'
    get 'mystores/:id/closing_confirm', to: 'mystores#closing_confirm', as: 'closing_confirm'
    patch 'mystores/:id/close', to: 'mystores#close', as: 'close'
    delete 'mystores/:mystore_id/mymenus/destroy_all', to: 'mymenus#destroy_all', as: 'destroy_all_mymenus'

    resources :stores, only: %i(show)

    resources :menus, only: %i(index)

    resources :mystores, only: %i(index new create show edit update) do
      resources :mymenus, only: %i(index create edit update destroy)
    end

  end

  #---------------------------------------------------------------------------------------
  # admin routes

  # URL：/admin/sign_in
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do

    root to: 'homes#top'
    post 'stores/:id/change_confirm', to: 'stores#change_confirm', as: 'change_confirm'

    resources :stores, only: %i(show edit update)

    resources :users, only: %i(index show edit update)

    resources :genres, only: %i(index create edit update)

  end

end
