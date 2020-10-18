class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.references :user, foreign_key: true
      t.references :reservation, foreign_key: true

      t.timestamps
    end
  end
end
