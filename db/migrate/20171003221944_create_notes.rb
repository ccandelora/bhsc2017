class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :description
      t.string :message
      t.integer :order

      t.timestamps
    end
  end
end
