# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :reports do
    get 'employees/contribution_salary_range'
  end
  namespace :inss do
    post 'calculators/calculate_discount', to: 'calculators#calculate_discount'
    resources :contribution_salary_ranges
  end
  resources :employees
  devise_for :users
  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
end
