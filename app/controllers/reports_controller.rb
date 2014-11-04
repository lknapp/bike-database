class ReportsController < ApplicationController
  before_action :authenticate_user!

  def bikes_sold_per_year
    @bikes_sold_per_year = Report.bikes_sold_per_year
  end

end
