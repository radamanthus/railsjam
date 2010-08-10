require 'digest'
class User < ActiveRecord::Base
  has_many :events, :through => :attendees
  
  acts_as_authentic
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  
  belongs_to :event

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  MIN_LENGTH = 6
  MAX_LENGTH = 20

  validates :name,     :presence     => true,
                       :length       => { :maximum => 50 }
  validates :email,    :presence     => true,
                       :format       => { :with => email_regex },
                       :uniqueness   => { :case_sensitive => false }
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => MIN_LENGTH..MAX_LENGTH }
  
  before_save :encrypt_password
  
  def has_password?(submitted_password)
    crypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  private
  
    def encrypt_password
      self.password_salt = make_salt if new_record?
      self.crypted_password = encrypt(password)
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end