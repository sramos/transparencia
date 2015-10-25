module Yearable extend ActiveSupport::Concern
  included do
    validates :application_date, presence: true
  end

  module ClassMethods
    # Returns available range of application years
    def application_dates_range
      self.minimum(:application_date)..self.maximum(:application_date)
    end
  end
end

