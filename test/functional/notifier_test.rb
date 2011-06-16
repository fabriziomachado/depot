require 'test_helper'

class NotifierTest < ActionMailer::TestCase
 setup do
    @order = orders(:one)
  end
  
  test "order_received" do
    mail = Notifier.order_received(@order)
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Dear Dave Thomas", mail.body.encoded
  end

  test "order_shipped" do
    mail = Notifier.order_shipped
    assert_equal "Order shipped", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
