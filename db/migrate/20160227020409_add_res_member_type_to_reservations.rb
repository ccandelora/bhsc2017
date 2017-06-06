class AddResMemberTypeToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :res_member_type, :string
  end
end
