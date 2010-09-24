class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets, :force => true do |t|
      t.string :user_name
      t.string :body
      t.string :twitter_id
      t.string :twitter_status_id
      t.datetime :tweet_date
      t.timestamps
    end
    add_index "tweets", ["tweet_date"], :name => "index_tweets_on_tweet_date"
    add_index "tweets", ["twitter_id"], :name => "index_tweets_on_twitter_id"
  end

  def self.down
    drop_table :tweets
  end
end