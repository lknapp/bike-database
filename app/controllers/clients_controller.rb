class ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :update]
  before_action :authenticate_user!

  def index
    @waiting_list = Client.waiting_list
    @clients = Client.all.reverse_order
  end

  def new
    @client = Client.new
  end

  def edit; end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to edit_client_url(@client), notice: 'Client was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @client.update(client_params)
      notice = 'Client was successfully updated.'
      unless @client.bike.update_attribute(:date_sold, @client.pickup_date)
        notice = "Unable to update client's bike sale date"
      end
      redirect_to edit_client_url(@client), notice: notice
    else
      render action: 'edit'
    end
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(
        :first_name,
        :last_name,
        :application_date,
        :gender,
        :age,
        :height,
        :weight,
        :helmet,
        :lock,
        :bike_id,
        :will_pay,
        :bike_type_requested,
        :agency_id,
        :notes,
        :bike_fixed,
        :number_of_calls,
        :application_voided,
        :pickup_date,
        :volunteer_at_pickup)
    end
end
