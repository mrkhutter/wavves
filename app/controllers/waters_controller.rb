class WatersController < ApplicationController
  before_action :set_water, only: [:show, :edit, :update, :destroy]

  # GET /waters
  # GET /waters.json
  def index
    @waters = Water.all
  end

  # GET /waters/1
  # GET /waters/1.json
  def show
  end

  # GET /waters/new
  def new
    @water = Water.new
  end

  # GET /waters/1/edit
  def edit
  end

  # POST /waters
  # POST /waters.json
  def create
    @water = Water.new(water_params)

    respond_to do |format|
      if @water.save
        ImageProcessor.new(@water).call
        format.html { redirect_to @water, notice: "Water was successfully created." }
        format.json { render :show, status: :created, location: @water }
      else
        format.html { render :new }
        format.json { render json: @water.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waters/1
  # PATCH/PUT /waters/1.json
  def update
    respond_to do |format|
      @water.images.attach(water_params[:images])
      if @water.update(water_update_params)
        format.html { redirect_to :index, notice: "Water was successfully updated." }
        format.json { render :show, status: :ok, location: @water }
      else
        format.html { render :edit }
        format.json { render json: @water.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waters/1
  # DELETE /waters/1.json
  def destroy
    @water.destroy
    respond_to do |format|
      format.html { redirect_to waters_url, notice: "Water was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_water
    @water = Water.with_attached_images.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def water_params
    params.require(:water).permit(:feeling, :intensity, images: [])
  end

  def water_update_params
    params.require(:water).permit(:feeling, :intensity)
  end
end
