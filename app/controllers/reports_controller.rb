class ReportsController < ApplicationController
  def index
    @categories = Category.all
  end

  def report_by_category
    category = params[:category][:id]
    @operations = Operation.joins(:category)
    .where(category_id: "#{category}")
     
    operation_date_amount = Operation.joins(:category)
    .where(category_id: "#{category}")
    .map {|operation| [operation.amount, operation.operation_date]}

    @operation_amount = operation_date_amount.map {|elem| elem[0]}
    @operation_date = operation_date_amount.map {|elem| elem[1].strftime("%m/%d/%Y")}   
  end

  def report_by_dates
    @start_date = params[:start_date]
    @end_date = params[:end_date]
   
    @operations = Operation.select(:amount, :name)
    .where('operation_date BETWEEN ? and ?', @start_date, @end_date)
    .group(:category_id)
    .joins(:category)

    operation_category_amount_by_date = @operations.map {|operation| [operation.name, operation.amount]}
    @category_by_dates = operation_category_amount_by_date.map {|elem| elem[0] }
    @amount_category_by_dates = operation_category_amount_by_date.map {|elem| elem[1] }
    
    # @operations = Operation.select(:amount, :name).where(operation_date: start_date..end_date).group(:category_id).joins(:category)
  end
end


