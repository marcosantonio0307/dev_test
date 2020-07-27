Rails.application.routes.draw do
  root to: 'power_generators#index'
  resources :home, only: %i[index]
  post 'power_generators/search' => 'power_generators#search', as: :search_power_generators
  post 'power_generators/calc_freight' => 'power_generators#calc_freight', as: :calc_freight
end
