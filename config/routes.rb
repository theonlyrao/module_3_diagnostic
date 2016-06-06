Rails.application.routes.draw do
  root 'search#show'
  get '/search', to: "search#index"
end
