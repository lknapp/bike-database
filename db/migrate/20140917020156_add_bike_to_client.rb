class AddBikeToClient < ActiveRecord::Migration[5.0]
  def change
    add_reference :clients, :bike, index: true
  end
end
