# encoding: UTF-8

class PatrimonyVehicle < ActiveRecord::Base
  validates :function_detail, presence: true
  validates :vehicles_number, presence: true
  validates :application_date, presence: true
end
