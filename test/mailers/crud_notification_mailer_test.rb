require "test_helper"

class CrudNotificationMailerTest < ActionMailer::TestCase
  test "create_not" do
    mail = CrudNotificationMailer.create_not
    assert_equal "Create not", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "update_not" do
    mail = CrudNotificationMailer.update_not
    assert_equal "Update not", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "delete_not" do
    mail = CrudNotificationMailer.delete_not
    assert_equal "Delete not", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
