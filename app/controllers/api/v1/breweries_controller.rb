module Api
  module V1
    class BreweriesController < ApplicationController
      def index
        breweries = BreweriesFacade.breweries(params[:location], params[:quantity])

        render json: BreweriesSerializer.new(breweries)
      end
    end
  end
end
