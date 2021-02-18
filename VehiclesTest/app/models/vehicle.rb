class Vehicle < ApplicationRecord
  belongs_to :vehicle_model
  validates :year, :price, presence: true

  def as_json
    r = {}
    r[:id] = id
    r[:model_name] = vehicle_model.name
    r[:brand_name] = vehicle_model.vehicle_brand.name
    r[:year] = year
    r[:mileage] = mileage
    r[:price] = price
    r
  end

  class << self
    def new_vehicle(params)
      brand = VehicleBrand.find_or_create_by!(name: params[:brand])
      model =  VehicleModel.find_or_create_by!(name: params[:model], vehicle_brand_id: brand.id)
      params[:vehicle_model_id] = model.id
      prepared_params = params.except(:brand, :model)
      Vehicle.new(prepared_params)
    end

    def filtered_results(params)
      model_name = params.fetch(:model_name, '')
      brand_name = params.fetch(:brand_name, '')
      greater_than_year =  params[:greater_than_year] ? params[:greater_than_year] : 1900
      lower_than_mileage = params[:lower_than_mileage] ? params[:lower_than_mileage] : 5250000
      lower_than_price = params[:lower_than_price] ? params[:lower_than_price] : 19000000

      Vehicle
        .eager_load(vehicle_model: [:vehicle_brand])
        .where("lower(vehicle_brands.name) LIKE lower(?) AND lower(vehicle_models.name) LIKE lower(?) AND vehicles.year > ? AND vehicles.mileage < ? AND vehicles.price < ?",
               "%#{brand_name}%",
               "%#{model_name}%",
               greater_than_year,
               lower_than_mileage,
               lower_than_price)
    end
  end
end