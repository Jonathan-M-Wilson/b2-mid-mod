Rails.application.routes.draw do

  get '/mechanics', to: 'mechanics#index'
  get '/parks/:id', to: 'amusement_parks#show'
end
