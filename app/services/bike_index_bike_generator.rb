class BikeIndexBikeGenerator
  def self.create_bike_index_bike(bike)
    {
      serial: bike.serial_number,
      manufacturer: bike.brand,
      owner_email: ENV["OWNER_EMAIL"],
      color: bike.color,
      is_for_sale: bike.purpose != "freecyclery",
      frame_model: bike.model,
      no_notify: true
    }.to_json
  end
end
