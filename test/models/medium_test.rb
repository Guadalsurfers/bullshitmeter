require 'test_helper'

class MediumTest < ActiveSupport::TestCase
  # Validations
  test 'should have an url' do
    assert_invalid? Medium.new, url: "can't be blank"
  end

  test 'must be valid if all requirements are met' do
    assert_valid? Medium.new(url: 'https://cosa.example.com/blah')
  end

  test 'fixtures must be valid' do
    assert_valid? media(:the_custodian)
  end

  # Relationships
  test "should have many articles" do
    assert_equal Set.new([articles(:bullshit)]), Set.new(media(:the_custodian).articles)
  end
end
