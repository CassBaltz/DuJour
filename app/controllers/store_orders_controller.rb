class StoreOrdersController < ApplicationController
attr_accessor :active

def todays_orders
	@meals_active = Meal.active
    @meal_active = @meals_active.first
   	if @meal_active.present?
    @todays_orders = Order.where(meal_id: @meal_active.id, store_id: current_store.id)
    @not_ready_for_pickup = @todays_orders.where('orders.ready_for_pickup = ?', false)
    @ready_for_pickup = @todays_orders.where('orders.ready_for_pickup = ?', true)
	end
end

def ready_for_pickup
	@order = Order.find_by_id(params[:format])
	@user = User.find_by_id(@order.user_id)
	@meal = Meal.find_by_id(@order.meal_id)
	@store = Store.find_by_id(@order.store_id)

	@order.update_attribute :ready_for_pickup, order_params[:ready_for_pickup]

	redirect_to store_current_orders_path

  OrderReady.order_ready_email(@user).deliver
end

def pickup_list
	@meals_active = Meal.active
    @meal_active = @meals_active.first
   	if @meal_active.present?
    @todays_orders = Order.where(meal_id: @meal_active.id, store_id: current_store.id)
    @order_option = @meal_active.order_options.first
    @ingredients = @order_option.ingredients
	end
end

def past_orders
	if params[:search_email]
	@customer = User.find_by_email(params[:search_email])
    @all_past_orders = Order.where(store_id: current_store.id, user_id: @customer.id).order("created_at DESC")
  	elsif params[:search_name]
    @customer = User.find_by_name(params[:search_name])
    @all_past_orders = Order.where(store_id: current_store.id, user_id: @customer.id).order("created_at DESC")
  	else
    @all_past_orders = Order.where(store_id: current_store.id).order("created_at DESC")
	end
end

private

def order_params
        params.require(:order).permit(:user_id, :meal_id, :order_option_id, :stripeToken, :store_id, :ready_for_pickup)
end

end