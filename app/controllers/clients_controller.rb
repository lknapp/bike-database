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
      redirect_to new_client_path, notice: 'Client was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @client.update(client_params)
    if @client.save
      redirect_to edit_client_url(@client), notice: "Client was successfully updated"
    else
      render action: 'edit', notice: "Unable to update client"
    end
  end

  def print_select
    @clients = Client.includes(:bike, :agency)
                     .where.not(bike_id: nil, agency_id: nil)
                     .order('assigned_bike_at DESC NULLS LAST')
                     .paginate(:page => params[:page], :per_page => 30)
  end

  def print_receipts
    client_ids = print_params.map{|key, value| key if value == "1"}.compact
    @clients = Client.find(client_ids)
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params["client"]["application_date"] = Date.strptime(params["client"]["application_date"], '%m/%d/%Y') if params["client"]["application_date"].present?
      params["client"]["pickup_date"] = Date.strptime(params["client"]["pickup_date"], '%m/%d/%Y') if params["client"]["pickup_date"].present?
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
        :application_voided,
        :pickup_date,
        :volunteer_at_pickup)
    end

    def print_params
      params.require(:print_clients)
    end
end
