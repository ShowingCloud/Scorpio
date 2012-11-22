class AddOrderColumnsForCallback < ActiveRecord::Migration
	def up
		add_column :orders, :alipay_cb_buyer_email, :string
		add_column :orders, :alipay_cb_buyer_id, :string
		add_column :orders, :alipay_cb_trade_status, :string
		add_column :orders, :alipay_cb_trade_no, :string
		add_column :orders, :alipay_cb_total_fee, :decimal, :precision => 6, :scale => 2
		add_column :orders, :alipay_cb_notify_time, :datetime
		add_column :orders, :expected_total_fee, :decimal, :precision => 6, :scale => 2, :default => 0
	end

	def down
		remove_column :orders, :alipay_cb_buyer_email
		remove_column :orders, :alipay_cb_buyer_id
		remove_column :orders, :alipay_cb_trade_status
		remove_column :orders, :alipay_cb_trade_no
		remove_column :orders, :alipay_cb_total_fee
		remove_column :orders, :alipay_cb_notify_time
		remove_column :orders, :expected_total_fee
	end
end
