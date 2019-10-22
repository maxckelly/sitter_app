Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  get "/", to: "pages#index", as: "root"

  get "/user_login_stage", to: "pages#user_login_stage", as: "user_login_stage"
  get "/parents", to: "parents#index", as: "parents_home"
end
