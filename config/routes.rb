Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "weathers#show"
  get 'weathers/', to: 'weathers#search', as: 'weather_search'
  resources :weathers
end
