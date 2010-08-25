class Mailer < ActionMailer::Base
  default :from => "noreply@railsjam.net"
  
  def mail_to_unregistered_users(user)
     @user = user
     mail(:to => "#{user.name} <#{user.email}>", :subject => "RailsJam 2010 Registration")     
  end
  
  def password_reset_instructions(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Password Resets")  
  end
  
  
end

