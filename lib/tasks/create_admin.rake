namespace :db do
  desc "Create admi user"
  task :create_admin_user => :environment do

      User.create!(:login => "admin", :email => "railsjam@gmail.com", :password => "animone3200", :password_confirmation => "animone3200", :user_type=>"Admin" )


   end

end
