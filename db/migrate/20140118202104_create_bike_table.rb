class CreateBikeTable < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.string :entry_date
      t.string :brand
      t.string :model
      t.string :type
      t.string :color
      t.boolean :freecyclery
      t.boolean :sale
      t.string :serial_number
      t.text :notes
      t.text :tag_info
      t.string :repaired_by
      t.string :completion_date
      t.string :price
    end
  end
end
