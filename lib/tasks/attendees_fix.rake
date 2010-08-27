namespace :fix do
  desc "Fix the boo boo"
  task :attendees => :environment do

    User.find(:all).each do |u|
      unless u.events and u.events.size > 0
         Mailer.deliver_mail_to_unregistered_users(u)
         puts "sending mail to #{u.email}"
      end
    end
  end

end

