require 'test_helper'

class SubscribeTest < ActionDispatch::IntegrationTest

  def setup
    @sub = Subscriber.new(email: 'tourniquet679876@gmail.combak')
  end


end
