class User < ApplicationRecord
  has_many :events, foreign_key: "creator_id"
  has_many :attendances, foreign_key: "attendee_id"
  has_many :attended_events, through: :attendances

  def upcomming_events
    self.attended_events.where("e_date > ?", Date.today)
  end
  
  def past_events
    self.attended_events.where("e_date < ?", Date.today)
  end
  
end
