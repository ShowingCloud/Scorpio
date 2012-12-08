class ChangeOrderColumnsGiftFlags < ActiveRecord::Migration
  	def up
		change_column :orders, :gift_flag, :integer, :default => 0
		change_column :orders, :gift_price, :integer, :default => 0
  	end
  
	def down
  	end
end
