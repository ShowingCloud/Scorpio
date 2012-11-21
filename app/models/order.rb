class Order < ActiveRecord::Base
  attr_accessible :order_id

  validates :order_id, :presence => true
  validates :mem_id, :presence => true
  validates :mem_name, :presence => true
  validates :mem_email, :presence => true
  validates :detail, :presence => true
  validates :payment, :presence => true
  validates :pay_status, :presence => true
end
