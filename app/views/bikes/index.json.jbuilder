json.array!(@bikes) do |bike|
  json.extract! bike, 
  json.url bike_url(bike, format: :json)
end