Rails.application.routes.draw do
  devise_for :users
  
  get "/", to: "pages#index", as: "root"

  get "/parents", to: "parents#index", as: "parents_home"
end
