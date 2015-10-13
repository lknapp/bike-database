class Bike < ActiveRecord::Base
  validates :log_number, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :bike_type, presence: true
  validates :color, presence: true
  validates :serial_number, presence: true

  def self.bike_types
    [
      ["BMX", "BMX"],
      ["Cruiser", "Cruiser"],
      ["Hybrid", "Hybrid"],
      ["Kids", "Kids"],
      ["Mountain", "Mountain"],
      ["Road", "Road"],
      ["Touring", "Touring"],
      ["Track", "Track"],
      ["Utility", "Utility"],
      ["Youth", "Youth"]
    ]
  end

  def name
    self.color + " " + self.brand + ' ' + self.model + " (" + self.log_number.to_s + ")"
  end

  def client
    Client.find_by bike_id: self.id
  end

  def ready_for_pickup?
    self.client && !client.application_voided && self.date_sold.nil?
  end

  def self.bikes_ready_for_pickup
    Bike.all.select{|bike| bike.ready_for_pickup?}
  end

  def self.available_for_freecyclery
    assigned_bikes = Client.all.select{|c| !c.bike_id.nil?}.map(&:bike)
    all_freecyclery_bikes = Bike.order(log_number: :desc).select{|bike| bike.purpose == "Freecyclery"}
    all_freecyclery_bikes - assigned_bikes
  end

  def mark_picked_up
    current_date = Time.new.strftime("%Y-%m-%d")
    self.update_attribute(:date_sold, current_date)
  end

  def post_to_bike_index
    return true if self.bike_index_id.present?
    BikeIndexLogger.perform_async(self.id)
  end
end
