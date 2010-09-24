namespace :twitter do
  desc "Save the tweets"
  task :save_tweets => :environment do

    Tweet.get_feeds.each do |t|
      new_tweet = Tweet.new
      new_tweet.user_name = t.from_user
      new_tweet.twitter_id = t.from_user_id
      new_tweet.body = t.text
      new_tweet.twitter_status_id = t.id
      new_tweet.tweet_date = t.created_at
      new_tweet.save!
      puts "Saved #{t.tweet}"
    end
  end

end

