class ReportsController < ApplicationController
  def index
  end

  def report_by_category
    @operations = Operation.group(:name)
  end

  def report_by_dates
    start_date = params[:start_date]
    end_date = params[:end_date]
    @operations = Operation.select{ |date| date >= start_date && date <= end_date}
    
  end
end


