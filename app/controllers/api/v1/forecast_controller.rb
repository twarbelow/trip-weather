module Api
  module V1
    class ForecastController < ApplicationController
      def index
        # return bad request response if params are bad
        forecast = ForecastFacade.forecast(params[:location])
        render json: ForecastSerializer.new(forecast)
      end
    end
  end
end
