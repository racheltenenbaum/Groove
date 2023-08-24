class Instrument < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy


  # def self.owner_name
  #   User.find(instrument.user_id).username
  # end
  has_one_attached :photo
end
