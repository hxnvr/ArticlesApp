# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  root 'articles#index'
  get '/posts', to: redirect('/articles', status: 302)
  resources :articles do
    get 'name_of_article', on: :member
    resources :comments
  end
end
