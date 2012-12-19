class ProductsController < ApplicationController

	respond_to :html, :json, :xml


	# GET /products
	def index
		@product = Product.find :all
		respond_with @product
	end


	# POST /products
	def create
		@product = Product.new params[:product], :without_protection => true
		@product.save
		respond_with @product
	end


	# GET /products/new
	def new
		@product = Product.new
		respond_with @product
	end


	# GET /products/:id/edit
	def edit
		@product = Product.find :first, :conditions => { :product_id => params[:id] }
	end


	# GET /products/:id
	def show
		@product = Product.find :first, :conditions => { :product_id => params[:id] }
		respond_with @product
	end


	# PUT /products/:id
	def update
		params[:product][:product_id] = params[:id]

		@product = Product.find :first, :conditions => { :product_id => params[:id] }
		@product.update_attributes params[:product], :without_protection => true
		respond_with @product
	end


	# DELETE /products/:id
	def destroy
		@product = Product.find :first, :conditions => { :product_id => params[:id] }
		@product.destroy
		respond_with @product
	end


	# POST /products/newproduct
	def newproduct
		@product = Product.new params[:product], :without_protection => true
		@product.save
		respond_with @product
	end


	# GET /products/getproduct
	def getproduct
		@product = Product.find :first, :conditions => { :product_id => params[:product_id] }
		respond_with @product
	end


	# GET /products/fetchallproduct
	def fetchallproduct
		@product = Product.find :all
		respond_with @product
	end


	# POST /products/updateproduct
	def updateproduct
		productparam = ActiveSupport::JSON.decode(params[:product]).delete_if { |k, v| v == nil }.symbolize_keys
		@product = Product.find :first, :conditions => { :product_id => productparam[:product_id] }
		@product.update_attributes productparam, :without_protection => true
		respond_with @product
	end


end
