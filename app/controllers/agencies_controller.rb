class AgenciesController < ApplicationController
  before_action :set_agency, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @agencies = Agency.all
  end

  def show
  end

  def new
    @agency = Agency.new
  end

  def edit
  end

  def create
    @agency = Agency.new(agency_params)
    if @agency.save
      redirect_to @agency, notice: 'Agency was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @agency.update(agency_params)
      redirect_to @agency, notice: 'Agency was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @agency.destroy
    redirect_to clients_url
  end

  private
    def set_agency
      @agency = Agency.find(params[:id])
    end

    def agency_params
      params.require(:agency).permit(
        :agency_name,
        :contact_name,
        :street_address,
        :city,
        :state,
        :postal_code,
        :phone_number,
        :email) 
    end
end
