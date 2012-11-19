class Product < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :product_name, :presence => true
end
