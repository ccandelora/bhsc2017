class CreatePublicPins < ActiveRecord::Migration
  def change
    create_table :public_pins do |t|
    	t.string :description
			t.timestamps
    end
  end
end
