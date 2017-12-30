FactoryGirl.define do
  factory :bike do
    sequence(:log_number)
    brand "Schwinn"
    model "Madison"
    bike_type "Fixed Gear"
    color "Yellow"
    sequence(:serial_number)
    sequence(:bike_index_id)
    location Bike::SEWARD_BASEMENT
  end

  trait :sale do
    purpose Bike::SALE
  end

  trait :freecyclery do
    purpose Bike::FREECYCLERY
  end
end
