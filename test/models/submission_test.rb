require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  test "should not save submission without title" do
    submission = Submission.new
    assert_not submission.save, "saved submission without a title"
  end

  test "should not save submission without author" do
    submission = Submission.new
    assert_not submission.save, "saved submission without author"
  end

  test "should not save submission without body" do
    submission = Submission.new
    assert_not submission.save, "saved submission without body"
  end
end
