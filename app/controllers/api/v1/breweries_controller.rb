class Api::V1::BreweriesController < ApplicationController
  def index
    breweries = BreweriesFacade(params[:location, params[:quantity]])
    render json: BreweriesSerializer.new(breweries)
  end
end
