module ReviewsHelper
  def star_rating(rating)
    # return rating unless rating.is_a?(Fixnum)
    # remainder = 5 - rating
    # '★' * rating + '☆'* remainder
    return rating unless rating.respond_to?(:round)
      rating = rating.round
      remainder = 5 - rating
      '★' * rating + '☆'* remainder
    end

end
