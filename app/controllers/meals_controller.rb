class MealsController < ApplicationController
  
  attr_accessor :past 

  def index
  	@past_meals = Meal.past.order("date DESC")
  end

  def show
  	@meal = Meal.find(params[:id])
  	@order_option = @meal.order_options.first

    respond_to do |format|
      format.html
      format.js
    end
  end

  def order_history
    @user = User.find(params[:id])
    if user_signed_in? && current_user.id == @user.id
    @my_orders = @user.orders
    else
    redirect_to root_path, :alert => "please sign in as the correct user to access that page"
    end
  end
  
end
