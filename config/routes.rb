Rails.application.routes.draw do

  post "/meetings/:id/:sitter_id/:parent_id", to: "meetings#create"
  get "/meetings/new/:sitter_id", to: "meetings#new", as: "meetings_new"
  get "/meetings/:id/:sitter_id", to: "meetings#show", as: "meetings_show"
  resources :meetings
  
  # Devise routes. The controller basically says to refer to the registrations controller.
  devise_for :users, controllers: { registrations: "registrations" }

  # Pages Routes
  get "/", to: "pages#index", as: "root"
  # This page appears when the user is trying to access a area of their site they're not allowed
  get "/unauthorised", to: "pages#unauthorised", as: "unauthorised"
  get "/email_confirm", to: "pages#email_confirmed", as: "email_confirm"

  # Parent Routes 
  get "/parents", to: "parents#index", as: "parents_home"
  post "/parents", to: "parents#create"
  get "/parents/new", to: "parents#new", as: "parents_new"
  get "/parents/:id", to: "parents#show", as: "parent"
  put "/parents/:id", to: "parents#update"
  patch "/parents/:id", to: "parents#update"
  delete "/parents/:id", to: "parents#destroy"
  get "/parents/:id/edit", to: "parents#edit", as: "edit_parent"
  get "/sitterdisplay", to: "parents#sitter_display", as: "parents_sitter_display"

  # Sitters Routes
  get "/sitters", to: "sitters#index", as: "sitters_home"
  post "/sitters", to: "sitters#create"
  get "/sitters/new", to: "sitters#new", as: "new_sitter"
  get "/sitters/:id", to: "sitters#show", as: "sitter"
  put "/sitters/:id", to: "sitters#update"
  patch "/sitters/:id", to: "sitters#update"
  delete "/sitters/:id", to: "sitters#destroy"
  get "/sitters/:id/edit", to: "sitters#edit", as: "edit_sitter"

  # Payment Routes
  post "/payments/:id/:meeting_id", to: "payments#create"
  get "/payments/new/:meeting_id", to: "payments#new", as: "payment_new"
  get "/payments/:id/:meeting_id", to: "payments#show", as: "payment_show"
  post "/payments/webhook", to: "payments#webhook"
  get "/payments/success", to: "payments#success", as: "payment_success"
end
