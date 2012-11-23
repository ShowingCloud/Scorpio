class AddOrderColumnsForNotify < ActiveRecord::Migration
	def up
		add_column :orders, :alipay_nt_notify_time, :datetime
		add_column :orders, :alipay_nt_trade_no, :string
		add_column :orders, :alipay_nt_trade_status, :string
		add_column :orders, :alipay_nt_create_time, :datetime
		add_column :orders, :alipay_nt_pay_time, :datetime
		add_column :orders, :alipay_nt_close_time, :datetime
		add_column :orders, :alipay_nt_refund_status, :string
		add_column :orders, :alipay_nt_refund_time, :datetime
		add_column :orders, :alipay_nt_buyer_email, :string
		add_column :orders, :alipay_nt_buyer_id, :string
		add_column :orders, :alipay_nt_total_fee, :decimal, :precision => 6, :scale => 2
		add_column :orders, :alipay_nt_discount, :decimal, :precision => 6, :scale => 2
	end

	def down
		remove_column :orders, :alipay_nt_notify_time
		remove_column :orders, :alipay_nt_trade_no
		remove_column :orders, :alipay_nt_trade_status
		remove_column :orders, :alipay_nt_create_time
		remove_column :orders, :alipay_nt_pay_time
		remove_column :orders, :alipay_nt_close_time
		remove_column :orders, :alipay_nt_refund_status
		remove_column :orders, :alipay_nt_refund_time
		remove_column :orders, :alipay_nt_buyer_email
		remove_column :orders, :alipay_nt_buyer_id
		remove_column :orders, :alipay_nt_total_fee
		remove_column :orders, :alipay_nt_discount
	end
end
