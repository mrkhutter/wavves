Rails.application.routes.draw do
  root to: "waters#index"
  resources :waters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
