class ReportsController < ApplicationController
  before_action :authenticate_user!

  def bikes_sold_per_year
    @yearly_data = Report.yearly_data
  end

  def bikes_fixed_per_week
    @weekly_data = Report.bikes_fixed_per_week
  end
end
