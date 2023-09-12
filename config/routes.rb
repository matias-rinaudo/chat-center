require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  resources :products
  get "panel" => "panel#index"
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  root to: "home#index"

  resources :orders do
    collection do
      match 'search' => 'orders#search', via: [:get, :post], as: :search
    end
  end
end
