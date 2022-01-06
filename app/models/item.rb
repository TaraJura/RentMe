class Item < ApplicationRecord
  has_many :rental_periods
  has_many :notes, as: :noteable
  belongs_to :user, class_name: "User"
  belongs_to :owner, class_name: "User"

  def current_rental_period 
  rental_periods.where(returned_at: nil).last
  end

end
