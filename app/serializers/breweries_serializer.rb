class BreweriesSerializer
  include JSONAPI::Serializer
  attributes :destination, :forecast, :breweries
  set_id {nil}
end
