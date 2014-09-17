class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @bikes = Bike.all
  end

  def show
  end

  def new
    @bike = Bike.new
  end

  def edit
  end

  def print_select
    @bikes = Bike.all
  end

  def print_labels
    bike_ids = print_params.map{|key, value| key if value == "1"}.compact
    @bikes = Bike.find(bike_ids)
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      redirect_to @bike, notice: 'Bike was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @bike.update(bike_params)
      redirect_to @bike, notice: 'Bike was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @bike.destroy
    redirect_to bikes_url
  end

  private
    def set_bike
      @bike = Bike.find(params[:id])
    end

    def bike_params
      params.require(:bike).permit(
        :entry_date, 
        :brand, 
        :model, 
        :bike_type, 
        :color, 
        :log_number, 
        :purpose, 
        :serial_number, 
        :notes, 
        :tag_info, 
        :mechanic, 
        :completion_date, 
        :price, 
        :top_tube_size, 
        :seat_tube_size,
        :created_at, 
        :updated_at) 
    end

    def print_params
      params.require(:print_bikes)
    end
end
