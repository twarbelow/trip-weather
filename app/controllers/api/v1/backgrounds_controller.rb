class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundFacade.search_for_background(params[:location])
    render json: BackgroundSerializer.new(background)
  end
end
