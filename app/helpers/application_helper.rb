module ApplicationHelper
  
  def full_title(page_title)
    base_title = "s. fair"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
  end

  def formatted_date(date)
  date.strftime("%b %d, '%y").downcase
  end

  def header_photo(meal)
  meal.meal_photos.first
  end

  def meal_chef(meal)
  meal.chef
  end	

 def is_active?(link_path)
  current_page?(link_path) ? "active" : ""
 end

  def stripe_price(item)
    (item.price * 100).to_i
  end

  def my_store(user)
      Store.find_by_id(user.relationships.my_current_store.store_id)
  end

end

