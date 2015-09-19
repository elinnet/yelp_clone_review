module ReviewsHelper
  def star_rating(rating)
    # return rating unless rating.is_a?(Fixnum)
    # remainder = 5 - rating
    # '★' * rating + '☆'* remainder

    if rating.is_a? (Fixnum)
      remainder = 5 - rating
      '★' * rating + '☆'* remainder
    elsif rating.is_a? (Float)
      rating = rating.round
      remainder = 5 - rating
      '★' * rating + '☆'* remainder
    else
      rating
    end
  end
end
