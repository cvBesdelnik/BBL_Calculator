class OperationsController < ApplicationController
  before_action :set_operation, only: %i[ show edit update destroy ]

  # GET /operations or /operations.json
  def index
    @operations = Operation.joins(:category)
    .select(:id, :amount, :operation_date, :description, :name).page(params[:page])
   
    # Also work
    #  @operations = Operation.joins(:category)
    #  .select('operations.amount, operations.description, operations.id, operations.operation_date, categories.name')
  end

    # GET /operations/1 or /operations/1.json
  def show
    @operation = Operation.joins(:category)
    .select(:id, :amount, :operation_date, :description, :name).find(params[:id])
  end

  # GET /operations/new
  def new
    @operation = Operation.new
    @categories = Category.all.map {|category| [category.name, category.id]}
  end

  # GET /operations/1/edit
  def edit
  end

  # POST /operations or /operations.json
  def create
    @operation = Operation.new(operation_params)

    respond_to do |format|
      if @operation.save
        format.html { redirect_to operation_url(@operation), notice: "Operation was successfully created." }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations/1 or /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to operation_url(@operation), notice: "Operation was successfully updated." }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1 or /operations/1.json
  def destroy
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to operations_url, notice: "Operation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      @operation = Operation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def operation_params
      params.require(:operation).permit(:amount, :operation_date, :description, :id, :name)
    end
end
