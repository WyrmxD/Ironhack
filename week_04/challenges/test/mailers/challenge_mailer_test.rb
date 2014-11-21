require 'test_helper'

class ChallengeMailerTest < ActionMailer::TestCase
  test "new_support" do
    mail = ChallengeMailer.new_support
    assert_equal "New support", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
