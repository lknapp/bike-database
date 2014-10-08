class Bike < ActiveRecord::Base
  validates :log_number, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :bike_type, presence: true
  validates :color, presence: true
  validates :serial_number, presence: true

  def name
    self.brand + ' ' + self.model
  end

  def client
    client = Client.find_by bike_id: self.id
  end

  def ready_for_pickup?
    client = self.client
    client && self.completion_date && !client.application_voided
  end

  def self.bikes_ready_for_pickup
    Bike.all.select{|bike| bike.ready_for_pickup?}
  end

end
