Rails.application.routes.draw do
  devise_for :users

  get "/", to: "pages#index", as: "root"

  get "/user_login_stage", to: "pages#user_login_stage", as: "user_login_stage"
  get "/parents", to: "parents#index", as: "parents_home"
end
