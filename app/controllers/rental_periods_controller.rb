class RentalPeriodsController < ApplicationController
  before_action :set_rental_period, only: %i[ show edit update destroy ]

  # GET /rental_periods or /rental_periods.json
  def index
    @rental_periods = RentalPeriod.all
  end

  # GET /rental_periods/1 or /rental_periods/1.json
  def show
  end

  # GET /rental_periods/new
  def new
    @rental_period = RentalPeriod.new(item_id:params[:item_id])
  end

  # GET /rental_periods/1/edit
  def edit

  end

  # POST /rental_periods or /rental_periods.json
  def create
    @rental_period = RentalPeriod.new(rental_period_params)

    respond_to do |format|
      if @rental_period.save
        format.html { redirect_to rental_period_url(@rental_period), notice: "Rental period was successfully created." }
        format.json { render :show, status: :created, location: @rental_period }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rental_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rental_periods/1 or /rental_periods/1.json
  def update
    respond_to do |format|
      if @rental_period.update(rental_period_params)
        format.html { redirect_to rental_period_url(@rental_period), notice: "Rental period was successfully updated." }
        format.json { render :show, status: :ok, location: @rental_period }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rental_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rental_periods/1 or /rental_periods/1.json
  def destroy
    @rental_period.destroy

    respond_to do |format|
      format.html { redirect_to rental_periods_url, notice: "Rental period was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def item_returned
  
  rental_period_returned = RentalPeriod.find(params[:id])
  rental_period_returned.update!(returned_at: Time.current)
  redirect_to items_path, notice: "Item was succesfully returned"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental_period
      @rental_period = RentalPeriod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rental_period_params
      params.require(:rental_period).permit(:from, :to, :returned_at, :item_id, :user_from_id, :user_to_id)
    end
end
