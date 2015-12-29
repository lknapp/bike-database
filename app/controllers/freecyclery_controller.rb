class FreecycleryController < ApplicationController
  before_action :authenticate_user!

  def closed_applications
    @closed_applications = Client.closed_applications
  end

  def available_bikes
    @available_bikes = Bike.available_for_freecyclery
  end

  def receipt
    @client = Client.find(params[:client_id])
  end

end
