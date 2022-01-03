class Item < ApplicationRecord
  has_many :rental_periods
  has_many :notes, as: :noteable
  has_one :user
end
