class Instrument < ApplicationRecord
  belongs_to :user
  # def self.owner_name
  #   User.find(instrument.user_id).username
  # end
  has_one_attached :photo

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
