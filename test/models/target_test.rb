require 'test_helper'

class TargetTest < ActiveSupport::TestCase

  def setup
    @target = Target.new(email: "foobar@example.com",
                         first_name: "foo",
                         last_name: "bar",
                         status: "student")
  end

  test "sould be valid" do
    assert @target.valid?
  end

  # email




end
