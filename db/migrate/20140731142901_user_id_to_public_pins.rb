class UserIdToPublicPins < ActiveRecord::Migration
  def change
  	add_column :public_pins, :user_id, :integer
    add_index :public_pins, :user_id
  end
end
