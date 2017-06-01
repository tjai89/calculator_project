Rails.application.routes.draw do
  root 'welcome#index'
  resources :interest_calculator
end
