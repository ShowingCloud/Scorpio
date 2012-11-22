class Order < ActiveRecord::Base
  attr_accessible :order_id, :order_time, :del_msg, :mem_id, :mem_name, :mem_email,
	  :mem_mobile, :del_name, :del_post, :del_prov, :del_city, :del_dist, :del_addr,
	  :del_mobile, :inv_flag, :inv_title, :detail, :payment, :ship, :ship_sched

  validates :order_id, :presence => true, :uniqueness => true
  validates :mem_id, :presence => true
  validates :mem_name, :presence => true
  validates :mem_email, :presence => true
  validates :detail, :presence => true
  validates :payment, :presence => true
  validates :pay_status, :presence => true
end
