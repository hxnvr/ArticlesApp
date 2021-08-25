# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  root 'articles#index'
  get '/posts', to: redirect('/articles', status: 302)
  resources :articles do
    resources :comments
  end
end
