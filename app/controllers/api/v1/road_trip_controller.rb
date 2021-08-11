module Api
  module V1
    class RoadTripController < ApplicationController
      skip_before_action :verify_authenticity_token, only: :create
      
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
