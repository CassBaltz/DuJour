class RelationshipsController < ApplicationController
	before_action :signed_in_user

	def create
	  @store = Store.find(params[:relationship][:store_id])
	  @relationship = current_user.relationships.create(store_id: @store.id)
	  
	  if @relationship.save

	  	@meals_active = Meal.active
	    @meal_active = @meals_active.first
	    @meals_past = Meal.past
	    @meal_past = @meals_past.order("date DESC").first
	    
	    @my_stores = current_user.relationships

	    if @meal_active.present? && @my_stores.present?
	    @store_meal = MealLimit.find_by_store_id_and_meal_id(@store.id, @meal_active.id)
	    @meals_available = MealLimit.meal_available
	    @meal_available = @store_meal && @meals_available
	    end


		  respond_to do |format|
		      format.html { redirect_to root_path }
		      format.js
		  end
	  else
	  	  redirect_to root_path, :notice => "#{@store.name} was not saved."
	  end


	end

end


	
 