module Bullshitmeter
  module Assertions
    def assert_invalid?(record, expected_errors = {})
      messages = []
      invalid = !record.valid? && expected_errors.all? do |attribute, message|
        errors = record.errors[attribute]
        if !errors.include?(message)
          messages << "Expected #{attribute} to have error '#{message}' but had instead #{errors.inspect}"
          next
        end
        true
      end
      assert invalid, messages.join("\n")
    end
    def assert_valid?(record)
      assert record.valid?, "Expected #{record.inspect} to be valid"
    end
  end
end
