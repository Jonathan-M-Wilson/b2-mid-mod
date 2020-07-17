Rails.application.routes.draw do

  get '/mechanics', to: 'mechanics#index'
  get '/parks/:id', to: 'amusement_parks#show'
  get '/mechanics/:id', to: 'mechanics#show'
  post '/mechanics/:id/mechanic_rides', to: 'mechanic_rides#create'
end
