class AlterReservationColumnType < ActiveRecord::Migration
  def up
   remove_column :reservations, :reservation_date
  end

  def down
  remove_column :reservations, :reservation_date
  end
end