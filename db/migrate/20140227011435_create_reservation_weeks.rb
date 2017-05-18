class CreateReservationWeeks < ActiveRecord::Migration
  def change
    create_table :reservation_weeks do |t|
      t.tsrange :res_date
      t.text :note

      t.timestamps
    end
  end
end
