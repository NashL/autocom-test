class Api::V1::VehiclesController < ApplicationController

  # GET api/v1/vehicles.json
  def index
    vehicles = Vehicle.filtered_results(filter_params)
    render json: vehicles.as_json, status: :ok
  end

  # POST api/v1/vehicles.json
  def create
    vehicle = Vehicle.new_vehicle(vehicle_params)
    if vehicle.save!
      render json: 'Vehicle added successfully', status: :created
    else
      render json: vehicle.errors, status: :unprocessable_entity
    end
  end

  private

  def filter_params
    params.slice(:model_name, :brand_name, :greater_than_year, :lower_than_mileage, :lower_than_price)
  end

  def vehicle_params
    params.permit(:brand, :model, :year, :price, :mileage)
  end

end
