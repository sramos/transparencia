# encoding: UTF-8

class PatrimonyVehicle < ActiveRecord::Base
  include Yearable

  validates :function_detail, presence: true
  validates :vehicles_number, presence: true
end
