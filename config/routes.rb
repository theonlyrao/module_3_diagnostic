Rails.application.routes.draw do
  root 'search#show'
  get '/search', to: "transportation_fuel#index"
end
