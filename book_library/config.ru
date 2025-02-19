# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server
Rails.application.routes.draw do
    resources :books do
      member do
        post :borrow
        post :return
      end
    end
    root "books#index"
  end