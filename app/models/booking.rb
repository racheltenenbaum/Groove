class Booking < ApplicationRecord
  belongs_to :instrument
  validates :start_date, comparison: { less_than: :end_date }
  validates :start_date, :end_date, presence: true
end
