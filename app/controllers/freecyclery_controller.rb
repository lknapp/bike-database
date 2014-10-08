class FreecycleryController < ApplicationController
  before_action :authenticate_user!

  def closed_applications
    @closed_applications = Client.closed_applications
  end

  def ready_for_pickup
    @bikes_for_pickup = Bike.bikes_ready_for_pickup
  end


end
