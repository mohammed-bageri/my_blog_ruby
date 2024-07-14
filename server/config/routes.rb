# frozen_string_literal: true

Rails.application.routes.draw do
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'

  scope '/api' do
    post 'registrations/sign-up', to: 'registrations#create'
    post 'sessions/sign-in', to: 'sessions#create'
    get 'sessions', to: 'sessions#show'
    resources :users
    resources :posts
  end
end
