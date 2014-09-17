class AddBikeToClient < ActiveRecord::Migration
  def change
    add_reference :clients, :bike, index: true
  end
end
