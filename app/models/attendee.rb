class AttendeeValidator < ActiveModel::Validator
    def validate(record)
      @event_user = Attendee.where(:user_id=>record.user_id, :event_id=>record.event_id).size
      
      if @event_user and @event_user > 0
        record.errors[:base] << "Sorry, you have already signed up for this event."
      end
      

    end
end


class Attendee < ActiveRecord::Base
  
  include ActiveModel::Validations
  validates_with AttendeeValidator

  belongs_to :event
  belongs_to :user
  

    
end


