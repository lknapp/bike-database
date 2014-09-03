class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

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
    if @volunteer.save
      redirect_to @volunteer, notice: 'Volunteer was successfully created.'
    else
      render action: 'new' 
    end
  end

  def update
    if @volunteer.update(volunteer_params)
      redirect_to @volunteer, notice: 'Volunteer was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @volunteer.destroy
    redirect_to volunteers_url
  end



  private
    def set_volunteer
      @volunteer = Volunteer.find(params[:id])
    end

    def volunteer_params
      params.require(:volunteer).permit(:name, :email, :phone) 
    end
end
