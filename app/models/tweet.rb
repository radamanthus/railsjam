class Tweet  < ActiveRecord::Base
  
  validates :twitter_id,  :presence => true
  validates :body, :presence => true
    
  require 'hpricot'
  require 'pp'
  
  def self.get_feeds
    pp Twitter::Search.new('#railsjam').since(100.days.ago).fetch().results
  end
  
  def self.recent
    self.all :order => 'tweet_date DESC', :limit => 1
  end
  
end