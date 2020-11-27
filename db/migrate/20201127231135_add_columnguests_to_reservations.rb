class AddColumnguestsToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :guests, :smallint
  end
end
