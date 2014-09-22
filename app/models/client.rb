class Client < ActiveRecord::Base
  has_one :bike
  belongs_to :agency
end
