class User < ActiveRecord::Base


  MIN_LENGTH = 6
  MAX_LENGTH = 20

  validates_uniqueness_of :email
  
  
  acts_as_authentic do |a|
    a.merge_validates_length_of_password_field_options :minimum => MIN_LENGTH
  end


end