require 'test_helper'

class SubscriptorTest < ActiveSupport::TestCase
  test 'should have a email' do
    assert_invalid? Subscriptor.new, email: "can't be blank"
  end

  test 'should have a unique email' do
    assert_invalid? subscriptors(:one).dup, email: "has already been taken"
  end

  test 'should be valid if all requirements are met' do
    assert_valid? Subscriptor.new(email: 'example@example.com')
  end

  test 'fixtures should be valid' do
    assert_valid? subscriptors(:one)
  end
end
