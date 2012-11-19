class ProductController < ApplicationController


	# GET /product
	# GET /product.json
	def index
		@product = Product.find :all

		respond_to do |format|
			format.html { redirect_to "/" }
			format.json { render :json => @product }
		end
	end


	# GET /product/1
	# GET /product/1.json
	def show
		@product = Product.find :all, :conditions => { :product_id => params[:id] }

		respond_to do |format|
			format.html { redirect_to "/" }
			format.json { render :json => @product }
		end
	end


	# POST /product/newproduct
	# POST /product/newproduct.json
	def newproduct
		@product = Product.new params

		respond_to do |format|
			if @product.save
				format.html { render :html => @product }
				format.json { render :json => { :return => "1" } }
			else
				format.html { render :html => @product.errors, :status => :unprocessable_entity }
				format.json { render :json => @product.errors, :status => :unprocessable_entity }
			end
		end
	end


	# GET /product/getproduct
	# GET /product/getproduct.json
	def getproduct
		@product = Product.find :all, :conditions => { :product_id => params[:product_id] }

		respond_to do |format|
			format.html { render :html => @product }
			format.json { render :json => @product }
		end
	end


	# GET /product/fetchallproduct
	# GET /product/fetchallproduct.json
	def fetchallproduct
		@product = Product.find :all

		respond_to do |format|
			format.html { render :html => @product }
			format.json { render :json => @product }
		end
	end


	# POST /product/updateproduct
	# POST /product/updateproduct.json
	def updateproduct
		@product = Product.find :all, :conditions => { :product_id => params[:product_id] }

		respond_to do |format|
			if @product.update_attributes params
				format.html { redirect_to @product }
				format.json { render :json => {:return => "1"} }
			else
				format.html { render :html => @product.errors, :status => :unprocessable_entity }
				format.json { render :json => @product.errors, :status => :unprocessable_entity }
			end
		end
	end


end
