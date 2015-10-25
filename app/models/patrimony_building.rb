# encoding: UTF-8

class PatrimonyBuilding < ActiveRecord::Base
  validates :address, presence: true
  validates :file_number, presence: true
  validates :application_date, presence: true
end
