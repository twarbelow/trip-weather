module Api
  module V1
    class RoadTripController < ApplicationController
      def create
        if User.find_by(api_key: params[:api_key])
          trip = RoadTripFacade.create_trip(params[:origin], params[:destination])
          render json: RoadtripSerializer.new(trip)
        else
          render status: :unauthorized, body: 'Invalid Credentials'
        end
      end
    end
  end
end
