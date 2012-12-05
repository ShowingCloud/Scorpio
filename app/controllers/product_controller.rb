class ProductController < ApplicationController

	respond_to :html, :json, :xml


	# GET /product
	def index
		@product = Product.find :all
		respond_with @product
	end


	# GET /product/:id
	def show
		@product = Product.find :all, :conditions => { :product_id => params[:id] }
		respond_with @product
	end


	# POST /product/newproduct
	def newproduct
		@product = Product.new params
		@product.save
		respond_with @product
	end


	# GET /product/getproduct
	def getproduct
		@product = Product.find :all, :conditions => { :product_id => params[:product_id] }
		respond_with @product
	end


	# GET /product/fetchallproduct
	def fetchallproduct
		@product = Product.find :all
		respond_with @product
	end


	# POST /product/updateproduct
	def updateproduct
		@product = Product.find :all, :conditions => { :product_id => params[:product_id] }
		@product.update_attributes params
		respond_with @product
	end


end
