class BreweriesSerializer
  include JSONAPI::Serializer
  attributes :id, :type, :destination, :forecast, :breweries
end
