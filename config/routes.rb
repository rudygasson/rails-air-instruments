Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # post '/instruments/:id/bookings', to: 'bookings#create'
  resources :instruments, only: %i[index show new create] do
    resources :bookings, only: %i[create]
  end
end
