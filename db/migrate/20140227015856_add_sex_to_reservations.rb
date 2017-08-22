class AddSexToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :sex, :string
  end
end
