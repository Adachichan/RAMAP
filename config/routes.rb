Rails.application.routes.draw do

  #---------------------------------------------------------------------------------------
  # public routes

  # URL：/users/sign_in
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #---------------------------------------------------------------------------------------
  # admin routes

  # URL：/admin/sign_in
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

end
