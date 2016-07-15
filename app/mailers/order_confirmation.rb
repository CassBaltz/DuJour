class OrderConfirmation < ActionMailer::Base
  default from: "from@example.com"

  def order_confirmation_email(order)
  	@order = order
  	mail(
  		to: User.find_by_id(order.user_id).email,
  		subject: "Thanks for the order")
  end
end
