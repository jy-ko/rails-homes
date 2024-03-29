# frozen_string_literal: true

class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  # GET /properties or /properties.json
  def index
    @properties = if params[:query].present? && params[:filter].present?
                    Property.where(bed: params[:filter]).search_by_address_and_name(params[:query])
                  elsif params[:query].present?
                    Property.search_by_address_and_name(params[:query])
                  elsif params[:filter].present?
                    Property.where(bed: params[:filter])
                  else
                    Property.all
                  end
    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        info_window: render_to_string(partial: 'info_window', locals: { property: property })
      }
    end
    @properties = @properties.page(params[:page]).per(10)
  end

  # GET /properties/1 or /properties/1.json
  def show; end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit; end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    @property.user = current_user

    respond_to do |format|
      if @property.save
        format.html { redirect_to property_url(@property), notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_url(@property), notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_params
    params.require(:property).permit(:name, :user_id, :address, :latitude, :longitude, :price, :currency,
                                     :surface_area, :bed, :bath, :floor, :photo)
  end
end
