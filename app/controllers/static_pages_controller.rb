class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  def home; end

  def bikes_by_location
    @sales_floor_bikes = Bike.where(location: Bike::SALES_FLOOR)
    @paulina_basement_bikes = Bike.where(location: Bike::PAULINA_BASEMENT)
    @seward_basement_bikes = Bike.where(location: Bike::SEWARD_BASEMENT)
  end
end
