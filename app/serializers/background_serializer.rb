class BackgroundSerializer
  include JSONAPI::Serializer

  attributes :id, :location, :description, :image_url, :credit
end
