class Product < ActiveRecord::Base
  validates :product_name, :presence => true
  validates :product_id, :presence => true
  validates :product_pic, :presence => true
  validates :price, :presence => true
  validates :retail, :presence => true
  validates :price_desc, :presence => true
end
