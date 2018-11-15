class SubscribeUserToMailchimpJob < ActiveJob::Base
  queue_as :default
  require 'gibbon'

  def perform(target)
    gibbon = Gibbon::Request.new(api_key: Rails.application.credentials[:mailchimp])
    gibbon.timeout = 10
    gibbon.lists(Rails.application.credentials[:mailchimp_list]).members.create(
      body:{
        email_address: target.email,
        status: "subscribed"
      }
    )
  end
end
