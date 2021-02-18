class Api::V1::VehicleModelsController < ApplicationController

  # POST api/v1/vehicle_models.json
  def create
    vehicle_model = VehicleModel.new_vehicle_model(vehicle_model_params)
    if vehicle_model.save!
      render json: 'Vehicle model added successfully', status: :created
    else
      render json: vehicle_model.errors, status: :unprocessable_entity
    end
  end

  private

  def vehicle_model_params
    params.permit(:name, :brand)
  end

  def transform_params(_params)
    _params[:vehicle_brand_id] = VehicleBrand.find_or_create_by!(name: _params[:brand]).id
    _params.except(:brand)
  end

end
