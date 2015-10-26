module Geograficable extend ActiveSupport::Concern
  included do
    # Defaults 
    geocoded_by :full_address, latitude: :latitude, longitude: :longitude, lookup: :opencagedata 
    after_validation :geocode, if: ->(obj){ obj.address.present? && obj.address_changed? } 
  end

  # Returns address including province and country
  def full_address
    [self.address, "Madrid", "Spain"].compact.join(", ") if self.address
  end

  module ClassMethods
  end
end

