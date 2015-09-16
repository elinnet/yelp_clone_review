class Restaurant < ActiveRecord::Base
  include WithUserAssociationExtension

  has_many :reviews,
        -> { extending WithUserAssociationExtension },
        dependent: :destroy
  belongs_to :user
  validates :name, length: { minimum: 2, too_short: "Error - name too short" }, uniqueness: true

end
