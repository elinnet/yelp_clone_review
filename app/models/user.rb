class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :restaurants
  has_many :reviewed_restaurants, through: :reviews, source: :restaurant
  has_many :reviews


  def already_reviewed?
    Restaurant.find(params[:id]).any?
  end

end
