class Restaurant < ActiveRecord::Base
  include WithUserAssociationExtension

  has_many :reviews,
        -> { extending WithUserAssociationExtension },
        dependent: :destroy
  belongs_to :user
  validates :name, length: { minimum: 2, too_short: "Error - name too short" }, uniqueness: true



  # def average_rating
  #   reviews.none? ? 'N/A' : reviews.average(:rating)
  # end
# .average method does not seem to work

  def average_rating
    return 'N/A' if reviews.none?
    reviews.inject(0) {|memo, review| memo + review.rating} / reviews.length
  end

end
