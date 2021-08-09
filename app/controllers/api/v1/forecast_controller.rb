class Api::V1::ForecastController < ApplicationController
  def index
    # return bad request response if params are bad
    forecast = ForecastFacade.forecast(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end
