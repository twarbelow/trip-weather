class BackgroundSerializer
  include JSONAPI::Serializer

  attributes :location, :description, :image_url, :credit
  set_type :background
  set_id {nil}
end
