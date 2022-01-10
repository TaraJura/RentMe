class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :notes_written , class_name: "Note"
  has_many :rental_periods, inverse_of: :user_from
  has_many :rented_items
  has_many :items_rented_to_others
  has_many :notes, as: :noteable
  accepts_nested_attributes_for :items 
  has_many :rental_periods_to, inverse_of: :user_to, class_name: "RentalPeriod", foreign_key: :user_to_id
end
