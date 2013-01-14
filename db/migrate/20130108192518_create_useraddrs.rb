class CreateUseraddrs < ActiveRecord::Migration
	def change
		create_table :useraddrs do |t|
			t.references :user

			t.string :addrname
			t.string :username
			t.integer :postal
			t.string :province
			t.string :city
			t.string :district
			t.string :address
			t.string :mobile
			t.string :phone

			t.timestamps
		end
		add_index :useraddrs, :user_id
	end
end
