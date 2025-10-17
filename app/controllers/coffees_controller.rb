class CoffeesController < ApplicationController
  before_action :set_coffee, only: %i[ show edit update destroy ]
  before_action :authenticate_admin, only: %i[ new create edit update destroy ]

  # GET /coffees or /coffees.json
  def index
  @coffees = Coffee.order(created_at: :desc)
  end

  # GET /coffees/1 or /coffees/1.json
  def show
  end

  # GET /coffees/new
  def new
    @coffee = Coffee.new
  end

  # GET /coffees/1/edit
  def edit
  end

  # POST /coffees or /coffees.json
  def create
    @coffee = Coffee.new(coffee_params)

    respond_to do |format|
      if @coffee.save
        format.html { redirect_to @coffee, notice: "Coffee was successfully created." }
        format.json { render :show, status: :created, location: @coffee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coffee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coffees/1 or /coffees/1.json
  def update
    respond_to do |format|
      if @coffee.update(coffee_params)
        format.html { redirect_to @coffee, notice: "Coffee was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @coffee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coffee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffees/1 or /coffees/1.json
  def destroy
    @coffee.destroy!

    respond_to do |format|
      format.html { redirect_to coffees_path, notice: "Coffee was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee
      @coffee = Coffee.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def coffee_params
      params.require(:coffee).permit(:name, :roaster, :origin, :roast_level, :tasting_notes, :rating, :website_url, :date_tried, :image)
    end
end
