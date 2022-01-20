class AddConfirmationNumberToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :confirmation_number, :string
  end
end
