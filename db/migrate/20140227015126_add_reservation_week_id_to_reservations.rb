class AddReservationWeekIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :reservation_week_id, :integer
    add_index :reservations, :reservation_week_id
  end
end
