class Volunteer < ActiveRecord::Base
  validates :name, presence: true
end
