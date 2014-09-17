class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.date :application_date
      t.string :gender
      t.integer :age
      t.integer :weight
      t.boolean :helmet
      t.boolean :lock
      t.string :agency
      t.date :completion_date


      t.timestamps
    end
  end
end
