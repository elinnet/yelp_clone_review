class Restaurant < ActiveRecord::Base

  def index
    @restaurants = Restaurant.all
  end
  
end
