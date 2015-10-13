namespace :db do
  desc "Add some random sample data"

  task dummy_data: :environment do
    puts "clearing users"
    User.destroy_all
    puts "clearing bikes"
    Bike.destroy_all
    puts "clearing clients"
    Client.destroy_all
    puts "clearing agencies"
    Agency.destroy_all
  

    def random_agency
      return {
        agency_name: Faker::Company.name,
        contact_name: Faker::Name.name,
        street_address: Faker::Address.street_address,
        city: Faker::Address.city,
        state: "IL",
        postal_code: Faker::Number.number(5),
        phone_number: Faker::Number.number(7),
        email: Faker::Internet.email
      }
    end

    def random_client
      return {
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        application_date: rand(5.years).ago,
        gender: ["male", "female"].sample,
        age: rand(45) + 15,
        weight: rand(100) + 100,
        helmet: [true, false].sample,
        lock: [true, false].sample,
        completion_date: [rand(30.days).ago, nil].sample,
        bike_type_requested: ["Cruiser", "Road", "Mountain"].sample,
        will_pay: [true, false].sample,
        notes: "A great client!",
        bike_fixed: [true, false].sample,
        number_of_calls: [0, 1, 2].sample,
        application_voided: [false, false, false, false, true].sample,
        pickup_date: rand(10.days).ago,
        volunteer_at_pickup: Faker::Name.first_name
      }
    end 
  
    def random_bike
      return {
        entry_date: rand(3.years).ago,
        brand: ["Windsor", "Schwinn", "Magna", "Fuji", "Cannondale", "Bianchi", "Jamis", "Felt"].sample,
        model: Faker::Hacker.verb,
        bike_type: ["Cruiser", "BMX", "Fixie", "Utility", "Road", "Hybrid", "Kids"].sample,
        color: Faker::Commerce.color,
        serial_number: Faker::Number.number(10),
        notes: Faker::Lorem.sentence,
        tag_info: Faker::Lorem.sentence,
        price: rand(400) + 50,
        seat_tube_size: rand(45),
        top_tube_size: rand(45),
        log_number: Faker::Number.number(8),
        purpose: ["Sale", "Freecyclery"].sample,
        mechanic: Faker::Name.first_name,
        new_parts: Array.new(4) {Faker::Commerce.product_name}.join("\n"),
        work_done: Faker::Hacker.say_something_smart
        ## , date_sold: rand(2.months).ago,
      }
    end

    puts "creating a new user"
    user = User.new(email: "user@example.com", password: "password").save
    
    puts "creating some clients"
    10.times do
      Client.new(random_client).save
    end
    clients = Client.all
       
    puts "creating some bikes"
    30.times do
      Bike.new(random_bike).save
    end
    bikes = Bike.all
  
    puts "creating some agencies"
    5.times do
      Agency.new(random_agency).save
    end
    agencies = Agency.all

    puts "assigning agencies to clients"
    Client.all.each do |client|
      client.update_attribute("agency_id", agencies.sample.id)
    end

    puts "assigning bikes to clients" 
    Client.all.each_with_index do |client, index|
      client.update_attribute("bike_id", Bike.all[index].id)
    end

  end
end
