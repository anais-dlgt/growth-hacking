require 'test_helper'

class TargetTest < ActiveSupport::TestCase

  def setup
    @target = { email: "foobar@example.com",
                first_name: "foo",
                last_name: "bar",
                type: "student"}
  end


end
