require 'gibbon'

gibbon = Gibbon::Request.new(api_key: Rails.application.credentials[:mailchimp])
gibbon.timeout = 10
