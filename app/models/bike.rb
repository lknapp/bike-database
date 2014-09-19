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

end
