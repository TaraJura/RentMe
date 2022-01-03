class AddUsersToRentalPeriods < ActiveRecord::Migration[6.1]
  def change
    add_column :rental_periods, :user_from_id, :integer
    add_column :rental_periods, :user_to_id, :integer
  end
end
