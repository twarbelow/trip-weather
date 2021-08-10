class Api::V1::RoadTripController < ApplicationController
  def create
    if User.find_by(api_key: params[:api_key])
      trip = RoadTripFacade.create_trip(params[:road_trip])
      render json: RoadTripSerializer.new(trip)
    else
      render status: :unauthorized, body: 'Invalid Credentials'
    end
  end
end
