class Instrument < ApplicationRecord
  belongs_to :user

  # def self.owner_name
  #   User.find(instrument.user_id).username
  # end

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?


  has_many :reviews, dependent: :destroy

  has_one_attached :photo



  # def self.owner_name
  #   User.find(instrument.user_id).username
  # end

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
