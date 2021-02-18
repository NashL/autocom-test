class VehicleModel < ApplicationRecord
  belongs_to :vehicle_brand
  has_many :vehicles
  validates :name, presence: true, uniqueness: true

  class << self
    def new_vehicle_model(params)
      params[:vehicle_brand_id] = VehicleBrand.find_or_create_by!(name: params[:brand]).id
      prepared_params = params.except(:brand)
      VehicleModel.new(prepared_params)
    end
  end

end
