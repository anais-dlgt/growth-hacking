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

  test "email should be present" do
    @target.email = "     "
    assert_not @target.valid?
  end

  test "email should not be too long" do
    @target.email = 'a' * 244 + '@example.com'
    assert_not @target.valid?
  end

  test "email validation should accept valid adresses" do
    valid_adresses = %w[target@example.com USER@foo.COM A_US-FR@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
    valid_adresses.each do |valid_adress|
      @target.email = valid_adress
      assert @target.valid?, "#{valid_adress.inspect} should be valid"
    end
  end

  test "email validation should reject invalid adresses" do
    invalid_adresses = %w[target@example,com target_at_foo.org target.name@example.
                          foo@bar_baz.fr foo@bar+baz.com foo@bar..com]
    invalid_adresses.each do |invalid_adress|
      @target.email = invalid_adress
      assert_not @target.valid?, "#{invalid_adress} should be invalid"
    end
  end

  test "email adresses should be unique" do
    duplicate_target = @target.dup
    duplicate_target.email = @target.email.upcase
    @target.save
    assert_not duplicate_target.valid?
  end

  test "email adresses should be save in lowercase" do
    mixed_case_email = "fOo-BaR@bAz.OrG"
    @target.email = mixed_case_email
    @target.save
    assert_equal mixed_case_email.downcase, @target.reload.email
  end




end
