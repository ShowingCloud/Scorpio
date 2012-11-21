class OrderController < ApplicationController


	# GET /order
	# GET /order.json
	def index
		@order = Order.find :all

		respond_to do |format|
			format.html { redirect_to "/" }
			format.json { render :json => @order }
		end
	end


	# GET /order/1
	# GET /order/1.json
	def show
		@order = Order.find :all, :conditions => { :order_id => params[:id] }

		respond_to do |format|
			format.html { redirect_to "/" }
			format.json { render :json => @order }
		end
	end


	# POST /order/neworder
	# POST /order/neworder.json
	def neworder
		data = {
			:order_id => rand(1e11),
			:order_time => DateTime.now(),
			:order_channel => "Novasol",
			:order_status => 0
		}

		if params[:comment]
			data.update ({ :del_msg => params[:comment] })
		end

		data.update ({
			:mem_id => "",
			:mem_name => "",
			:mem_email => "",
			:mem_mobile => ""
		})

		data.update ({
			:del_name => params[:del_name],
			:del_post => params[:del_post].to_i,
			:del_prov => params[:del_prov],
			:del_city => params[:del_city],
			:del_dist => params[:del_dist],
			:del_addr => params[:del_addr],
			:del_mobile => params[:del_mobile]
		})

		if params[:inv_flag]
			data.update ({ :inv_flag => params[:inv_flag] })

			if params[:inv_title]
				data.update ({ :inv_title => params[:inv_title] })
			end
		end

		payment_code = { 1 => 11, 2 => 2 };
		payment_price = { 1 => 10, 2 => 20 };

		data.update ({
			:detail => params[:detail],
			:payment => payment_code[params[:payment].to_i],
			:ship => payment_price[params[:payment].to_i],
			:pay_status => 0,
			:ship_sched => params[:ship_sched],
		})

		@order = Order.new data

		respond_to do |format|
			if @order.save
				format.html { render :html => @order }
				format.json { render "alipay/pay.json" }
			else
				format.html { render :html => @order.errors, :status => :unprocessable_entity }
				format.json { render :json => { :status => "0" } }
			end
		end
	end


	# GET /order/getorder
	# GET /order/getorder.json
	def getorder
		@order = Order.find :all, :conditions => { :order_id => params[:order_id] }

		respond_to do |format|
			format.html { render :html => @order }
			format.json { render :json => @order }
		end
	end


	# GET /order/fetchallorder
	# GET /order/fetchallorder.json
	def fetchallorder
		@order = Order.find :all

		respond_to do |format|
			format.html { render :html => @order }
			format.json { render :json => @order }
		end
	end


	# POST /order/updateorder
	# POST /order/updateorder.json
	def updateorder
		@order = Order.find :all, :conditions => { :order_id => params[:order_id] }

		respond_to do |format|
			if @order.update_attributes params
				format.html { redirect_to @order }
				format.json { render :json => {:return => "1"} }
			else
				format.html { render :html => @order.errors, :status => :unprocessable_entity }
				format.json { render :json => @order.errors, :status => :unprocessable_entity }
			end
		end
	end


	# POST /order/returnorder
	# POST /order/returnorder.json
	def returnorder
		@order = Order.find :all, :conditions => { :order_id => params[:order_id] }

		respond_to do |format|
			if @order.update_attributes params
				format.html { redirect_to @order }
				format.json { render :json => {:return => "1"} }
			else
				format.html { render :html => @order.errors, :status => :unprocessable_entity }
				format.json { render :json => @order.errors, :status => :unprocessable_entity }
			end
		end
	end


	# POST /order/statusorder
	# POST /order/statusorder.json
	def statusorder
		@order = Order.find :all, :conditions => { :order_id => params[:order_id] }

		respond_to do |format|
			if @order.update_attributes params
				format.html { redirect_to @order }
				format.json { render :json => {:status => "1"} }
			else
				format.html { render :html => @order.errors, :status => :unprocessable_entity }
				format.json { render :json => @order.errors, :status => :unprocessable_entity }
			end
		end
	end


	# POST /order/addcart
	# POST /order/addcart.json
	def addcart
		product = params[:product]
		amount = params[:amount].to_i

		if not session[:cart]
			session[:cart] = {}
		end

		if session[:cart][product]
			session[:cart][product] += amount
		else
			session[:cart][product] = amount
		end

		respond_to do |format|
			format.html { redirect_to "/pages/42" }
			format.json { render :json => {:status => "1"} }
		end
	end


	# POST /order/checkout
	# POST /order/checkout.json
	def checkout
		session[:cart] = ActiveSupport::JSON.decode params[:detail]
		session[:payment] = params[:payment]

		if session[:payment] != '1' and session[:payment] != '2'
			redirect_to "/"
		end

		respond_to do |format|
			format.html { redirect_to "/pages/49" }
			format.json { render :json => {:status => "1"} }
		end
	end


	# POST /order/payment
	# POST /order/payment.json
	def payment
	end


	# POST /order/callback
	# POST /order/callback.json
	def callback
	end


end
