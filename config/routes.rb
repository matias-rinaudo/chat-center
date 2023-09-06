Rails.application.routes.draw do
  resources :products
  get "panel" => "panel#index"
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  root to: "home#index"
end
