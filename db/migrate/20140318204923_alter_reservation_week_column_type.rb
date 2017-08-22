class AlterReservationWeekColumnType < ActiveRecord::Migration
  def up
   remove_column :reservation_weeks, :res_date
  end

  def down
   remove_column :reservation_weeks, :res_date
  end
end