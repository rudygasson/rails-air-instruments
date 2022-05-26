Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }

  # route to user sign out
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_scope :user do
    get 'users/:id', to: 'users/registrations#show', as: "profile"
  end

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :instruments, only: %i[index show new create] do
    resources :bookings, only: %i[new create]
  end
end
