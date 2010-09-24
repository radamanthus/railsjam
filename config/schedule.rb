# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


every 2.hours do
  rake "twitter:save_tweets RAILS_ENV=production"
end

#0 0,2,4,6,8,10,12,14,16,18,20,22 * * * cd  ~/public_html/railsjam.net/current && RAILS_ENV=production /usr/bin/env rake twitter:save_tweets RAILS_ENV=production
