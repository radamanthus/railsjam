class AttendeeValidator < ActiveModel::Validator
    def validate(record)
      @attendee = Attendee.where(:user_id=>record.user_id, :event_id=>record.event_id).size
      
      if @attendee and @attendee > 0
        record.errors[:base] << "Sorry, you have already signed up for this event."
      end
      

    end
end


class Attendee < ActiveRecord::Base
  
  include ActiveModel::Validations
  validates_with AttendeeValidator

  belongs_to :event
  belongs_to :user
  
  def self.is_registered(user,event)
    @attendee = Attendee.where(:user_id=>user, :event_id=>event).size 
    if @attendee and @attendee.size > 0
      return true
    end
  end
  

    
end


