class GoogleMapsController < ApplicationController
  before_action :set_google_map, only: %i[ show edit update destroy ]

  # GET /google_maps or /google_maps.json
  def index
    @google_maps = GoogleMap.all
  end

  # GET /google_maps/1 or /google_maps/1.json
  def show
  end

  # GET /google_maps/new
  def new
    @google_map = GoogleMap.new
  end

  # GET /google_maps/1/edit
  def edit
  end

  # POST /google_maps or /google_maps.json
  def create

    @latitude = params[:latitude]
    @longitude = params[:longitude]
    @location = params[:location]
    @number_of_floors = params[:number_of_floors]
    @client_name = params[:client_name]
    @number_of_batteries = params[:number_of_batteries]
    @number_of_columns = params[:number_of_columns]
    @number_of_elevators = params[:number_of_elevators]
    @full_name_technical_contact = params[:full_name_technical_contact]
    
    @google_map = GoogleMap.new(google_map_params)

    respond_to do |format|
      if @google_map.save
        format.html { redirect_to google_map_url(@google_map), notice: "Google map was successfully created." }
        format.json { render :show, status: :created, location: @google_map }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @google_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /google_maps/1 or /google_maps/1.json
  def update
    respond_to do |format|
      if @google_map.update(google_map_params)
        format.html { redirect_to google_map_url(@google_map), notice: "Google map was successfully updated." }
        format.json { render :show, status: :ok, location: @google_map }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @google_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /google_maps/1 or /google_maps/1.json
  def destroy
    @google_map.destroy

    respond_to do |format|
      format.html { redirect_to google_maps_url, notice: "Google map was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_google_map
      @google_map = GoogleMap.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def google_map_params
      params.fetch(:google_map, {})
    end
end
