class CreateUsersecrets < ActiveRecord::Migration
	def change
		create_table :usersecrets do |t|
			t.references :user

			t.string :password
			t.string :oauth
			t.string :oauth_secret

			t.timestamps
		end
		add_index :usersecrets, :user_id
	end
end
