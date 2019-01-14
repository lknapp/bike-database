class BikesController < ApplicationController
  before_action :set_bike, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    respond_to do |format|
      format.html {
        @bikes = Bike.all.order(:log_number).reverse_order.paginate(:page => params[:page], :per_page => 30)
        @unsold_bikes = @bikes.select{|bike| bike.date_sold.nil? && bike.purpose == "Sale"}
      }
      format.csv {
        @all_bikes = Bike.all.order(:log_number).reverse_order
        send_data @all_bikes.to_csv, filename: "bikes-#{Date.today}.csv"
      }
    end
  end

  def new
    @bike = Bike.new
    @bike.location = Bike::SALES_FLOOR
    @previous_bike = Bike.order(:log_number).last
    @log_number = @previous_bike.log_number + 1
  end

  def edit
    @next_bike = Bike.where(log_number: @bike.log_number + 1).first
    @previous_bike = Bike.where(log_number: @bike.log_number - 1).first
    @client = @bike.client
  end

  def print_select
    @bikes = Bike.where.not(purpose: "Freecyclery").order(:log_number).reverse_order.paginate(:page => params[:page], :per_page => 30)
  end

  def print_labels
    bike_ids = print_params.map{|key, value| key if value == "1"}.compact
    @bikes = Bike.find(bike_ids)
  end

  def search
    bike = Bike.where(log_number: params[:log_number]).first
    if bike
      redirect_to edit_bike_path(bike)
    else
      flash[:notice] = 'No bike with that log number was found'
      redirect_to action: 'home', controller: 'static_pages'
    end
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      redirect_to new_bike_path, notice: 'Bike was successfully created.'
    else
      @previous_bike = Bike.order(:log_number).last
      @log_number = @bike.log_number
      render action: 'new'
    end
  end

  def update
    if @bike.update(bike_params)
      redirect_to edit_bike_path(@bike), notice: 'Bike was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def mark_as_sold
    @bike = Bike.find(params[:id])
    if @bike.mark_sold
      redirect_to bikes_url, notice: @bike.name + ' was marked as sold on ' + @bike.date_sold.strftime("%Y-%m-%d") + '.'
    else
      render action: edit, notice: 'Bike sale date could not be updated'
    end
  end

  private
    def set_bike
      @bike = Bike.find(params[:id])
    end

    def bike_params
      params[:bike][:fixed_at] = DateTime.strptime(params[:bike][:fixed_at], "%m/%d/%Y") if params[:bike][:fixed_at].present?
      params[:bike][:date_sold] = DateTime.strptime(params[:bike][:date_sold], "%m/%d/%Y") if params[:bike][:date_sold].present?
      params.require(:bike).permit(
        :time_spent,
        :fixed_at,
        :brand,
        :model,
        :bike_type,
        :color,
        :log_number,
        :purpose,
        :serial_number,
        :tag_info,
        :mechanic,
        :price,
        :top_tube_size,
        :seat_tube_size,
        :new_parts,
        :work_done,
        :date_sold,
        :location,
        :created_at,
        :updated_at)
    end

    def print_params
      params.require(:print_bikes)
    end
end
