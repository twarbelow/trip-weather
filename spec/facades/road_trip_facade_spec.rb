require 'rails_helper'

RSpec.describe 'RoadTrip Facade' do
  describe '::create_trip' do
    it 'creates a Roadtrip object', :vcr do
      params = {origin: 'denver,co', destination: 'pueblo,co'}
      trip = RoadTripFacade.create_trip(params[:origin], params[:destination])

      expect(trip).to be_a(Roadtrip)
      expect(trip.start_city).to eq(params[:origin])
      expect(trip.end_city).to eq(params[:destination])
      expect(trip.travel_time).to be_a(String)
      expect(trip.weather_at_eta.keys).to contain_exactly(:temperature, :conditions)
      expect(trip.weather_at_eta[:temperature]).to be_a(Float)
      expect(trip.weather_at_eta[:conditions]).to be_a(String)
    end
  end
end
