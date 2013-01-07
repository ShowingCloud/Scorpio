class CreateAliases < ActiveRecord::Migration
	def change
		create_table :aliases do |t|
			t.integer :col_id, :default => 0
			t.string :col_name, :null => false
			t.integer :row_id, :default => 0
			t.string :name, :null => false
			t.string :name_cn, :null => false

			t.timestamps
		end
	end
end
