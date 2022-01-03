class CreateRentalPeriods < ActiveRecord::Migration[6.1]
  def change
    create_table :rental_periods do |t|
      t.date :from
      t.date :to
      t.date :returned_at

      t.timestamps
    end
  end
end
