Rails.application.routes.draw do
  resources :contacts, as: :users, only: %I[index create]
end
