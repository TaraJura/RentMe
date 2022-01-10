class Item < ApplicationRecord
  has_many :rental_periods
  has_many :notes, as: :noteable
  belongs_to :user, class_name: "User"
  belongs_to :owner, class_name: "User"
  has_one_attached :avatar

  def current_rental_period 
  rental_periods.where(returned_at: nil).last
  end

  def rented_by_user
    current_rental_period&.user_to
  end

  def rental_period_returned_by_user
    rental_periods.where(returned_at: nil).count > 0
  end

  def rental_period_created_by_user
    rental_periods.where(returned_at: nil).count > 0 == false
  end
end

