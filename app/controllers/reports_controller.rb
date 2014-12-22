class ReportsController < ApplicationController
  before_action :authenticate_user!

  def bikes_sold_per_year
    @yearly_data = Report.yearly_data
  end

end
