class OrderReady < ActionMailer::Base
  default from: "from@example.com"

  def order_ready_email(user)
  	@user = user
  	mail(
  		to: user.email,
  		subject: "Ready for pickup!")
  end
end
