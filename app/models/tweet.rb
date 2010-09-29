class Tweet  < ActiveRecord::Base
  
  validates :twitter_id,  :presence => true
  validates :body, :presence => true
  validates :twitter_status_id, :presence=>true, :uniqueness=>true
  validates :tweet_date, :presence=>true
    
  require 'hpricot'
  require 'pp'
  
  def self.get_feeds
    begin 
      pp Twitter::Search.new('#railsjam').since(100.days.ago).fetch().results
    rescue
      return nil 
    end
  end
  
  def self.recent
    self.all :order => 'tweet_date DESC', :limit => 1
  end
  
end