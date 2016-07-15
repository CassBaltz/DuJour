class StaticPagesController < ApplicationController

attr_accessor :active, :past, :my_current_store  

  def home
    @meals_active = Meal.active
    @meal_active = @meals_active.first
    @meals_past = Meal.past
    @meal_past = @meals_past.order("date DESC").first
    
    unless @meal_active.nil?
   
    @meal_photos = @meal_active.meal_photos
    @meal = Meal.find_by_id(@meal_active.id)
    
    else

    @meal_photos = @meal_past.meal_photos
    @meal = Meal.find_by_id(@meal_past)
    end
    
    if user_signed_in?
    @my_stores = current_user.relationships
    end

    if @meal_active.present? && @my_stores.present?
    @store = Store.find_by_id(current_user.relationships.my_current_store.store_id)
    @store_meal = MealLimit.find_by_store_id_and_meal_id(@store.id, @meal_active.id)
    @meals_available = MealLimit.meal_available
    @meal_available = @store_meal && @meals_available
    end

    if current_store.present? && @meal_active.present?
    @order_count = Order.where(meal_id: @meal_active.id).where(store_id: current_store.id).count
    end
   end

  def close_store_list
    @close_stores = current_user.stores_nearby
    @user_zip = current_user.user_location
    

    @meals_active = Meal.active
    @meal_active = @meals_active.first

    @meals_available = MealLimit.meal_available 

    respond_to do |format|
      format.html
      format.js 
    end
  end

  def stores_index
    @meals_active = Meal.active
    @meal_active = @meals_active.first

    if user_signed_in?
    @my_stores = current_user.relationships
    end

    if @meal_active.present? && @my_stores.present?
    @store = Store.find_by_id(current_user.relationships.current_store.store_id)
    @store_meal = MealLimit.find_by_store_id_and_meal_id(@store.id, @meal_active.id)
    @meals_available = MealLimit.meal_available
    @meal_available = @store_meal && @meals_available
    end

    if user_signed_in? && (params[:search_zip].nil? || params[:search_zip].empty?)
    @zip_code = current_user.zip.to_s.to_latlon
    @my_stores = current_user.relationships

    elsif user_signed_in? && params[:search_zip].present?
    @zip_code = params[:search_zip].to_s.to_latlon
    @my_stores = current_user.relationships
    
    elsif user_not_signed_in? && params[:search_zip].present?
    @zip_code = params[:search_zip].to_s.to_latlon
    
    else

    @zip_code = 27613.to_s.to_latlon

    end

    @stores = Store.all
    @stores.to_json
  end

  def about
  end

  def contact
  end

  def help
  end

  def privacy
  end

end
