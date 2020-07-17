class MechanicRidesController < ApplicationController

  def create
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:ride_id])
    MechanicRide.create(ride_id: params[:ride_id], mechanic_id: params[:mechanic_id])
    redirect_to "/mechanics/#{mechanic.id}"
  end
end
