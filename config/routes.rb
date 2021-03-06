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
  # post '/instruments/:id/bookings', to: 'bookings#create'
  resources :instruments, only: %i[index show new create destroy] do
    resources :bookings, only: %i[create destroy]
  end
end
