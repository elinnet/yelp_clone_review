class UserController < ApplicationController

  if current_user.has_reviewed? @restaurant
    error message
  end

end
