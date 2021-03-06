# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comments
  resources :events
  resources :episodes
  # RESTful routes
  resources :examples, except: %i[new edit]
  resources :users, only: %i[index show update]
  resources :relationships, only: %i[index show create destroy]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
end
