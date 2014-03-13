class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :edit, :update, :destroy]

  def index 
    @volunteers = Volunteer.all
  end
  def show; end
  def new
    @volunteer = Volunteer.new
  end
  def edit; end
 
  def create
    @volunteer = Volunteer.new(volunteer_params)
    respond_to do |format|
      if @volunteer.save
        format.html { redirect_to @volunteer, notice: 'Volunteer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bike }
      else
        format.html { render action: 'new' }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update; end
  def destroy; end

  private
    def set_volunteer
      @volunteer = Volunteer.find(params[:id])
    end

    def volunteer_params
      params.require(:volunteer).permit(:name, :email, :phone) 
    end
end
