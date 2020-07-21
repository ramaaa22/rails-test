# frozen_string_literal: true

Rails.application.routes.draw do
  resources :devices

  root to: "devices#index"

  namespace 'api' do
    namespace 'v1' do
      resources :updates
    end
end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
