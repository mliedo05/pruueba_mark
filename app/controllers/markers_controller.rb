class MarkersController < ApplicationController
  before_action :set_marker, only: %i[ show edit update destroy ]

  # GET /markers or /markers.json
  def index
    @markers = Marker.all
    @subcategories = Subcategory.all

    @marker_type = Type.group(:marker_id).count.transform_keys {|key| Marker.find(key).name}
  end

  # GET /markers/1 or /markers/1.json
  def show
  end

  # GET /markers/new
  def new
    @marker = Marker.new
    @subcategories = Subcategory.all
  end

  # GET /markers/1/edit
  def edit
    @subcategories = Subcategory.all
  end

  # POST /markers or /markers.json
  def create
    @subcategories = Subcategory.all
    @marker = Marker.new(marker_params)
    @markers = Marker.all
    respond_to do |format|
      if @marker.save
        format.js { render nothing: true}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /markers/1 or /markers/1.json
  def update
    @subcategories = Subcategory.all
    @markers = Marker.all
    respond_to do |format|
      if @marker.update(marker_params)
        format.js { render nothing: true }
        format.html { redirect_to @marker, notice: "Marker was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markers/1 or /markers/1.json
  def destroy
   if @marker.destroy
      @markers = Marker.all
      respond_to do |format|
        format.js { render nothing: true }
        format.html { redirect_to markers_url, notice: "Marker was successfully destroyed." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marker
      @marker = Marker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def marker_params
      params.require(:marker).permit(:name, :url, :subcategory_id)
    end
end
