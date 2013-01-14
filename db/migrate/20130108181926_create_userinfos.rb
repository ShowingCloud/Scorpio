class CreateUserinfos < ActiveRecord::Migration
	def change
		create_table :userinfos do |t|
			t.references :user

			t.string :email
			t.integer :gender
			t.datetime :birthdate
			t.integer :status, :default => 0
			t.string :photo
			t.string :nickname

			t.string :column1
			t.string :column2
			t.string :column3
			t.string :column4
			t.string :column5
			t.string :column6
			t.string :column7
			t.string :column8
			t.string :column9
			t.string :column10

			t.timestamps
		end
		add_index :userinfos, :user_id
	end
end
