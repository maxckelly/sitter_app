Rails.application.routes.draw do

  # Devise routes. The controller basically says to refer to the registrations controller.
  devise_for :users, controllers: { registrations: "registrations" }


  # Pages Routes
  get "/", to: "pages#index", as: "root"
  get "/user_login_stage", to: "pages#user_login_stage", as: "user_login_stage"

  # Parent Routes 
  get "/parents", to: "parents#index", as: "parents_home"
  post "/parents", to: "parents#create"
  get "/parents/new", to: "parents#new", as: "parents_new"
  get "/parents/:id", to: "parents#show", as: "parent"
  put "/parents/:id", to: "parents#update"
  patch "/parents/:id", to: "parents#update"
  delete "/parents/:id", to: "parents#destroy"
  get "/parents/:id/edit", to: "parents#edit", as: "edit_parent"
end
