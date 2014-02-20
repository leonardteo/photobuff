json.array!(@photos) do |photo|
  json.extract! photo, :title, :description, :image, :thumbnail
  json.url photo_url(photo, format: :json)
end
