class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.tsrange :reservation_date
      t.string :name
      t.boolean :wed
      t.boolean :thur
      t.boolean :fri
      t.boolean :sat
      t.boolean :sun
      t.boolean :mon
      t.boolean :tue
      t.boolean :dinner
      t.text :comment

      t.timestamps
    end
  end
end
