FactoryGirl.define do
  factory :bike do
    sequence(:log_number)
    brand "Windsor"
    model "Clockwork"
    bike_type "Fixed Gear"
    color "Black"
    sequence(:serial_number)
  end
end
