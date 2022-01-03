class User < ApplicationRecord
  has_many :items
  has_many :notes_written , class_name: "Note"
  has_many :rental_periods
  has_many :rented_items
  has_many :items_rented_to_others
  has_many :notes, as: :noteable
  accepts_nested_attributes_for :items 
end
