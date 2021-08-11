class BreweriesSerializer
  include JSONAPI::Serializer
  attributes :type, :destination, :forecast, :breweries
  set_id {nil}
end
