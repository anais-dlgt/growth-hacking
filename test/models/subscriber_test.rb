require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase

    def setup
      @subscriber = Subscriber.new(email: "foobar@example.com")
    end

    # email

    test "email should be present" do
      @subscriber.email = "     "
      assert_not @subscriber.valid?
    end

    test "email should not be too long" do
      @subscriber.email = 'a' * 244 + '@example.com'
      assert_not @subscriber.valid?
    end

    test "email validation should accept valid adresses" do
      valid_adresses = %w[subscriber@example.com USER@foo.COM A_US-FR@foo.bar.org
                          first.last@foo.jp alice+bob@baz.cn]
      valid_adresses.each do |valid_adress|
        @subscriber.email = valid_adress
        assert @subscriber.valid?, "#{valid_adress.inspect} should be valid"
      end
    end

    test "email validation should reject invalid adresses" do
      invalid_adresses = %w[subscriber@example,com subscriber_at_foo.org subscriber.name@example.
                            foo@bar_baz.fr foo@bar+baz.com foo@bar..com]
      invalid_adresses.each do |invalid_adress|
        @subscriber.email = invalid_adress
        assert_not @subscriber.valid?, "#{invalid_adress} should be invalid"
      end
    end

    test "email adresses should be unique" do
      duplicate_subscriber = @subscriber.dup
      duplicate_subscriber.email = @subscriber.email.upcase
      @subscriber.save
      assert_not duplicate_subscriber.valid?
    end

    test "email adresses should be save in lowercase" do
      mixed_case_email = "fOo-BaR@bAz.OrG"
      @subscriber.email = mixed_case_email
      @subscriber.save
      assert_equal mixed_case_email.downcase, @subscriber.reload.email
    end

end
