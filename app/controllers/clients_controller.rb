class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @waiting_list = Client.waiting_list
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url }
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
        :weight,
        :helmet,
        :lock,
        :completion_date,
        :bike_id,
        :agency_id,
        :notes,
        :bike_fixed,
        :number_of_calls,
        :application_voided,
        :pickup_date,
        :volunteer_at_pickup) 
    end
end
