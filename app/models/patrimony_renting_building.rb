# encoding: UTF-8

class PatrimonyRentingBuilding < ActiveRecord::Base
  include Yearable

  validates :address, presence: true
  validates :file_number, presence: true
end
