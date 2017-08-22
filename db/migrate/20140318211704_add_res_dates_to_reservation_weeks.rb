class AddResDatesToReservationWeeks < ActiveRecord::Migration
  def change
    add_column :reservation_weeks, :res_date, :date
  end
end
