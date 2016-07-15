class MealLimitsController < ApplicationController
  before_action :signed_in_store, only: [:update, :create]

  attr_accessor :editable, :active, :past

  def index
  	@editable_meals = Meal.editable.order('date asc')
    @id = current_store.id
    @meal_limit_set = @editable_meals.joins(:meal_limits).where('meal_limits.store_id = ?', @id)
    @meal_limit_not_set = @editable_meals.where.not(id: @meal_limit_set)
  end

  def show
  	@meal = Meal.find(params[:id])
  end
 
  def create
    @editable_meals = Meal.editable.order('date asc')
    @id = current_store.id
    @meal_limit_set = @editable_meals.joins(:meal_limits).where('meal_limits.store_id = ?', @id)
    @meal_limit_not_set = @editable_meals.where.not(id: @meal_limit_set)
    current_store.meal_limits.create!(meal_limit_params)
    respond_to do |format|
      format.html { redirect_to store_meal_index_path }
      format.js
    end
  end

  def destroy
    @meal_limit = MealLimit.find(params[:id])
    current_store.meal_limits.destroy(@meal_limit)
    @editable_meals = Meal.editable.order('date asc')
    @id = current_store.id
    @meal_limit_set = @editable_meals.joins(:meal_limits).where('meal_limits.store_id = ?', @id)
    @meal_limit_not_set = @editable_meals.where.not(id: @meal_limit_set)
    respond_to do |format|
      format.html { redirect_to store_meal_index_path }
      format.js
    end
  end

    private

    def meal_limit_params
      params.require(:meal_limit).permit(:store_id, :meal_id, :availability,
                           :current_orders)
    end

 end

