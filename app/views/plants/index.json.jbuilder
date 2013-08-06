json.array!(@plants) do |plant|
  json.extract! plant, :name
  json.url plant_url(plant, format: :json)
end
