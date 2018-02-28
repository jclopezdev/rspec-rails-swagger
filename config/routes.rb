Rails.application.routes.draw do
  resources :contacts, as: :users, only: [:index]
end
