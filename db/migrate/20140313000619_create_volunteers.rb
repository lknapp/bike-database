class CreateVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.date :orientation_date
      t.integer :other_volunteer_hours
      t.text :referral
      t.text :reason
      t.text :skills
      t.text :wants
      t.boolean :interested_in_improving
      t.boolean :available_weekends
      t.boolean :available_weekdays
      t.boolean :available_shorter_hours
      t.boolean :available_longer_hours
      t.boolean :flexible
      t.text :questions
      t.text :improve_orientation
    end
  end
end
