class AddItemToRentalPeriod < ActiveRecord::Migration[6.1]
  def change
    add_reference :rental_periods, :item, null: false, foreign_key: true
  end
end
