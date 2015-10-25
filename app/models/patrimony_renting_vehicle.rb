# encoding: UTF-8

class PatrimonyRentingVehicle < ActiveRecord::Base
  include Yearable

  validates :model, presence: true
  validates :function_detail, presence: true
  validates :vehicles_number, presence: true
end
