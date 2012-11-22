class Product < ActiveRecord::Base
  attr_accessible :product_name, :product_id, :product_pid, :name_desc, :gallery,
	  :price, :retail, :price_desc, :spec, :cert, :desc, :adv, :comp, :usage, :orig

  validates :product_name, :presence => true
  validates :product_id, :presence => true
  validates :product_pic, :presence => true
  validates :price, :presence => true
  validates :retail, :presence => true
  validates :price_desc, :presence => true
end
