class Mailer < ActionMailer::Base
  default :from => "noreply@railsjam.net"
  

  
  def password_reset_instructions(user)
    subject      "RailsJam - Password Reset Instructions"
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Password Resets")  
  end
  
  
end

