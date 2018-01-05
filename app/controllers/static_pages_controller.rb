class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  def home; end

  def bikes_by_location
    @sales_floor_bikes = Bike.where(location: Bike::SALES_FLOOR, purpose: Bike::SALE)
    @paulina_basement_bikes = Bike.where(location: Bike::PAULINA_BASEMENT, purpose: Bike::SALE)
    @seward_basement_bikes = Bike.where(location: Bike::SEWARD_BASEMENT, purpose: Bike::SALE)
  end
end
