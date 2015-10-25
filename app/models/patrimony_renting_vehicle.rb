# encoding: UTF-8

class PatrimonyRentingVehicle < ActiveRecord::Base
  validates :model, presence: true
  validates :function_detail, presence: true
  validates :vehicles_number, presence: true
  validates :application_date, presence: true
end
