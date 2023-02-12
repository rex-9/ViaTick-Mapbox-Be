class PinsController < ApplicationController
  before_action :set_pin, only: :update

  def index
    pins = Pin.all
    render json: pins, except: [:created_at, :updated_at]
  end

  def update
    if @pin.update(pin_params)
      render json: { data: @pin, status: "success" }
    else
      render json: { error: @pin.errors, status: "failure" }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pin_params
      params.permit(:label, :lng, :lat)
    end
end
