Rails.application.routes.draw do
  root to: 'power_generators#index'
  resources :home, only: %i[index]
  post 'power_generators/search' => 'power_generators#search', as: :search_power_generators
end
