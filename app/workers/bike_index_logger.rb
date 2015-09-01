class BikeIndexLogger
  include Sidekiq::Worker
  def perform(bike_id)
    bike = Bike.find(bike_id)

    conn = Faraday.new(:url => "#{ENV['BIKE_INDEX_URL']}") do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end

    response = conn.post do |req|
      req.url "/api/v2/bikes?access_token=#{ENV['BIKE_INDEX_TOKEN']}"
      req.headers['Content-Type'] = 'application/json'
      req.body = BikeIndexLogger.create_bike_index_bike(bike)
    end

    bike.update_attribute :bike_index_id, JSON.parse(response.body)['bike']['id'] if response.status == 201
  end

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
