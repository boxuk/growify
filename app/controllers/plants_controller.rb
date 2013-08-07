class PlantsController < ApplicationController
  before_filter :authenticate_user!, :except => [:update]

  #load_and_authorize_resource
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  # GET /plants
  # GET /plants.json
  def index
    @plants = Plant.where(user: current_user)
  end

  # GET /plants/1
  # GET /plants/1.json
  def show
  end

  # GET /plants/new
  def new
    @plant = Plant.new
  end

  # GET /plants/1/edit
  def edit
  end

  # POST /plants
  # POST /plants.json
  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user

    respond_to do |format|
      if @plant.save
        format.html { redirect_to @plant, notice: 'Plant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @plant }
      else
        format.html { render action: 'new' }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plants/1
  # PATCH/PUT /plants/1.json
  def update
    respond_to do |format|
      if @plant.update(plant_params)
        format.html { redirect_to @plant, notice: 'Plant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_moisture
    plant = Plant.find(params[:id])
    plant.moisture_level = params[:moisture]
    
    plant.save
    redirect_to plants_url
  end

  # DELETE /plants/1
  # DELETE /plants/1.json
  def destroy
    @plant.destroy
    respond_to do |format|
      format.html { redirect_to plants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plant
      @plant = Plant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plant_params
      params.require(:plant).permit(:name, :user_id, :priority)
    end
end
