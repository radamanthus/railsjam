namespace :sponsors do
  desc "Add the Sponsors"
  task :add => :environment do

    Sponsor.create!(:name=>"DevCon", :description=>'DevCon Foundation is a non-stock, non-profit organization which aims to promote the "IT Pinoy Talent" mainly by providing a unique venue for IT educators and students, IT professionals, and IT enthusiasts to sync, support and succeed.', :link=>"http://www.devcon.ph/")
    Sponsor.create!(:name=>"Exist", :description=>"Founded in 2001, Exist is a software engineering innovation leader that specializes in developing enterprise software, interactive web applications and technology software solutions for US-, Asia Pacific- and Australia-headquartered organizations.", :link=>"http://www.exist.com/")
    Sponsor.create!(:name=>"aelogica", :description=>"aeogica is a U.S.-based developer of cloud and mobile applications. The principals, Steven Talcott Smith and Travis Vocino, seek to expand Philippine operations in the coming year and wish to encourage development of the Philippine Ruby on Rails community.", :link=>"http://aelogica.com/")
    Sponsor.create!(:name=>"The Pragmatic Programmers", :description=>"Several technologists worldwide see The Pragmatic Programmers as the leading source of programming and programming-related resources (books, videos, audio). For Rubyists, it definitely has the most valuable list of books for those who want to learn the language.", :link=>"http://pragprog.com/")
    Sponsor.create!(:name=>"Manning Publications Co.", :description=>"Manning Publications is an American publisher established by Lee Fitzpatrick and Marjan Bace that publishes books on computer technology topics, with a particular focus on web development.", :link=>"http://www.manning.com/")
    Sponsor.create!(:name=>"Nullpointer.ph", :description=>'It is a question and answer site for Filipino and Philippine-based programmers. Recently they have added a "job board":http://jobs.nullpointer.ph too.', :link=>"http://nullpointer.ph/")
   
    
  end

end

