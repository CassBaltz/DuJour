class OrdersController < ApplicationController
before_action :signed_in_user, only: [:create]

attr_accessor :current_orders, :meal_available, :meal_not_available

def create

@order = current_user.orders.create(order_params)

	if @order.save

	@order_option = OrderOption.find_by_id(@order.order_option_id)
	@amount = (@order_option.price * 100).to_i

	begin

	customer = Stripe::Customer.create(
    :email => params[:email],
    :card  => params[:stripeToken]
  )

	charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => current_user.name,
    :currency    => 'usd'
  )

			@store = Store.find_by_id(@order.store_id)
			@meal = Meal.find_by_id(@order.meal_id)
			@increment_value = @order_option.feeds.to_f
			@meal_limit = @store.meal_limits.find_by_meal_id(@meal.id)	

			@order.update_attribute :stripeToken, params[:stripeToken] 
			
			@meal_limit.increment!(:current_orders, @increment_value)

			redirect_to order_path(@order)
			OrderConfirmation.order_confirmation_email(@order).deliver

    rescue Stripe::StripeError => e
    redirect_to root


    end
      
	else

	redirect_to root_url
	flash[:alert] = "your order didn't work"

	end
end

def show
	@order = Order.find(params[:id])

		if (user_signed_in? && current_user.id == @order.user_id) || (store_signed_in? && current_store.id == @order.store_id)
			@order_option = OrderOption.find_by_id(@order.order_option_id)
			@order_user = User.find_by_id(@order.user_id)
			@meal = Meal.find_by_id(@order.meal_id)
			@store = Store.find_by_id(@order.store_id)
			@customer = User.find_by_id(@order.user_id)
			@meal_limit = @store.meal_limits.find_by_meal_id(@meal.id)
		else 
			redirect_to root_url, :notice => "You are not authorized to see that page"
		end
end

def index
end



	private

	def order_params
	      params.require(:order).permit(:user_id, :meal_id, :order_option_id, :stripeToken, :store_id)
	end
end

