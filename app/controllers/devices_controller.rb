# frozen_string_literal: true

class DevicesController < ApplicationController
  before_action :set_device, only: %i(edit update destroy)
  skip_before_action :verify_authenticity_token

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all
    
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit; end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to devices_path, notice: "Device was successfully created." }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
		#Encontrar registro por id
    @device=Device.find(params[:id]) 
	end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to devices_path, notice: "Device was successfully updated." }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_path, notice: "Device was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_device
    @device = Device.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def device_params
    params.require(:device).permit(:serial)
  end
end
