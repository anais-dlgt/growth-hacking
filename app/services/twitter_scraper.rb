require 'twitter'
class TwitterScraper

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials[:thelille_config_key]
      config.consumer_secret     = Rails.application.credentials[:thplille_config_secret]
      config.access_token        = Rails.application.credentials[:thplille_token_key]
      config.access_token_secret = Rails.application.credentials[:thplille_token_secret]
    end
  end

  def followers
    @users = []
    essi = @client.followers()
    j = essi.attrs[:users].count
    j.times do |i|
      @users << essi.attrs[:users][i][:screen_name]
    end
  end

  def friends
    @friends = []
    ami_ext = @client.friends()
    j = ami_ext.attrs[:users].count-1
    j.times do |i|
      @friends << ami_ext.attrs[:users][i][:screen_name]
    end
  end

  def tweeter
    @client.update("I'm tweeting with @gem!")
  end

  def tweet_perso
    @users.each do |user|
      begin
          @client.update("@#{user} Hello! Je suppose que tu as vu nos nombreux messages, je me demandais si tu avais un projet de startup ou d’entreprenariat en cours? http://bit.ly/bellejournee")
      rescue Exception, NotFound, Forbidden
        next
      end
    end
  end



  def perform
    followers
    tweeter
    tweet_perso

  end

end
