require 'test_helper'

class UsermailerTest < ActionMailer::TestCase
  test "new_task" do
    mail = Usermailer.new_task
    assert_equal "New task", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "updated_task" do
    mail = Usermailer.updated_task
    assert_equal "Updated task", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
