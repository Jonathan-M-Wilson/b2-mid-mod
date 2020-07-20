Rails.application.routes.draw do

  get '/mechanics', to: 'mechanics#index'
  get '/parks/:id', to: 'amusement_parks#show'
  get '/mechanics/:id', to: 'mechanics#show'
  post '/mechanic_rides/:mechanic_id', to: 'mechanic_rides#create'
end
