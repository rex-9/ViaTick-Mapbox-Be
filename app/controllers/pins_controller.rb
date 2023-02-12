class PinsController < ApplicationController
  def index
    pins = Pin.all
    render json: pins, except: [:created_at, :updated_at]
  end
end
