class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: "attended_event_id"
  has_many :attendees, through: :attendances

  scope :past, -> {where("e_date < ?", Date.today)}
  scope :future, -> {where("e_date > ?", Date.today)}
end
