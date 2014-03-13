class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

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

  def create
    @bike = Bike.new(bike_params)
    respond_to do |format|
      if @bike.save
        format.html { redirect_to @bike, notice: 'Bike was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bike }
      else
        format.html { render action: 'new' }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bike.update(bike_params)
        format.html { redirect_to @bike, notice: 'Bike was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bike.destroy
    respond_to do |format|
      format.html { redirect_to bikes_url }
      format.json { head :no_content }
    end
  end

  private
    def set_bike
      @bike = Bike.find(params[:id])
    end

    def bike_params
      params.require(:bike).permit(:entry_date, :brand, :model, 
                                   :type, :color, :frame_size, 
                                   :log_number, :purpose, :serial_number, 
                                   :notes, :tag_info, :mechanic, 
                                   :completion_date, :price, 
                                   :top_tube_size, :seat_tube_size,
                                   :created_at, :updated_at) 
    end
end
