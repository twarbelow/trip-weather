module Api
  module V1
    class BackgroundsController < ApplicationController
      def index
        background = BackgroundFacade.search_for_background(params[:location])
        render json: BackgroundSerializer.new(background)
      end
    end
  end
end
