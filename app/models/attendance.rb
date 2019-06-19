class Attendance < ApplicationRecord
    belongs_to :attendee, class_name: 'User'
    belongs_to :attended_even, class_name: "Event"
end
