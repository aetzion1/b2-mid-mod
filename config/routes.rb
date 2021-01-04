Rails.application.routes.draw do
  get '/studios', to:'studios#index'
  get '/movies/:id', to:'movies#show'
  get '/actors/:id', to:'actors#show'

  post "/movies/:id", to: "casts#create"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
