class Restaurant < ActiveRecord::Base
  has_many :reviews
  validates :name, length: { minimum: 2, too_short: "Error - name too short" }, uniqueness: true
end
