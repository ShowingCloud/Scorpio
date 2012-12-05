class AddOrderColumnsIfSynced < ActiveRecord::Migration
   	def up
		add_column :orders, :got_order, :integer, :default => 0
  	end

	def down
		remove_column :orders, :got_order
  	end
end
