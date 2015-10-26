# encoding: UTF-8

class PatrimonyRentingBuilding < ActiveRecord::Base
  include Yearable
  include Geograficable

  validates :address, presence: true
  validates :file_number, presence: true
end
