require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test 'should have a name' do
    assert_invalid? Author.new, name: "can't be blank"
  end

  test 'should be valid if all requirements are met' do
    assert_valid? Author.new(name: 'Juan Palomo')
  end

  test 'fixtures should be valid' do
    assert_valid? authors(:juan)
  end
end
