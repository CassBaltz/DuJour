class StoresController < ApplicationController

 before_action :signed_in_store, only: [:edit, :update]
 before_action :correct_store,   only: [:edit, :update]

attr_accessor :active, :past

  def edit
  end

  def update
    @store = Store.find(params[:id])
    if @store.update_attributes(store_params)
      flash[:success] = "Profile updated"
      redirect_to root_url
  	else
      render 'edit'
  	end
  end

  def show
  @store = Store.find(params[:id])

    @meals_active = Meal.active
    @meal_active = @meals_active.first
    @meals_past = Meal.past
    @meal_past = @meals_past.order("date DESC").first

    if user_signed_in?
    @my_stores = current_user.relationships
    end

    if @meal_active.present? && @my_stores.present?
    @store_meal = MealLimit.find_by_store_id_and_meal_id(@store.id, @meal_active.id)
    @meals_available = MealLimit.meal_available
    @meal_available = @store_meal && @meals_available
    end


    respond_to do |format|
      format.html
      format.js 
    end
  end

private

    def store_params
      params.require(:store).permit(:name, :zip, :email, :password, :password_confirmation, :street, :street_alt,
      :city, :state, :latitude, :longitude)
    end

    def correct_store
      @store = Store.find(params[:id])
      redirect_to(root_url) unless current_store?(@store)
    end
end

