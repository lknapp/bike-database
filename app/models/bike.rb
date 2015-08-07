class Bike < ActiveRecord::Base
  validates :log_number, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :bike_type, presence: true
  validates :color, presence: true
  validates :serial_number, presence: true
  after_save :post_to_bike_index

  def name
    self.brand + ' ' + self.model
  end

  def client
    client = Client.find_by bike_id: self.id
  end

  def ready_for_pickup?
    client = self.client
    client && self.completion_date && !client.application_voided && self.date_sold.nil?
  end

  def self.bikes_ready_for_pickup
    Bike.all.select{|bike| bike.ready_for_pickup?}
  end

  def self.available_for_freecyclery
    Bike.all.select{|bike| bike.completion_date && (bike.purpose == "Freecyclery") && !bike.client }
  end

  def mark_picked_up
    current_date = Time.new.strftime("%Y-%m-%d")
    self.update_attribute(:date_sold, current_date)
  end

  def post_to_bike_index
    return true if self.bike_index_id.present?

    conn = Faraday.new(:url => "#{ENV['BIKE_INDEX_URL']}") do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end

    response = conn.post do |req|
      req.url "/api/v2/bikes?access_token=#{ENV['BIKE_INDEX_TOKEN']}"
      req.headers['Content-Type'] = 'application/json'
      req.body = BikeIndexBikeGenerator.create_bike_index_bike(self)
    end

    self.update_attribute :bike_index_id, JSON.parse(response.body)['bike']['id'] if response.status == 201


  end

end
