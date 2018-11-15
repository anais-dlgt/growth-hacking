load 'app/services/twitter_scraper.rb'

desc "This task is called by the Heroku scheduler add-on"
task :scheduler => :environment do
    puts "Sending message to Followers"
      TwitterScraper.new.perform
    puts "done."
end
