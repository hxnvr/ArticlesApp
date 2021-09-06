# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'articles#index'
  get '/posts', to: redirect('/articles', status: 302)
  resources :articles do
    resources :comments
  end
end
