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
		@order = Order.new params

		respond_to do |format|
			if @order.save
				format.html { render :html => @order }
				format.json { render :json => { :return => "1" } }
			else
				format.html { render :html => @product.errors, :status => :unprocessable_entity }
				format.json { render :json => @product.errors, :status => :unprocessable_entity }
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
			session[:cart][product] = session[:cart][product].to_i + amount
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
			respond_to do |format|
				format.html { redirect_to "/" }
				format.json { render :json => { :status => "0" } }
			end
			return
		end

		respond_to do |format|
			format.html { redirect_to "/pages/49" }
			format.json { render :json => { :status => "1" } }
		end
	end


	# POST /order/payment
	# POST /order/payment.json
	def payment
		data = {
			:order_id => rand(1e11),
			:order_time => DateTime.now(),
		}

		if params[:comment]
			data.update ({ :del_msg => params[:comment] })
		end

		mokard = Savon.client "http://www.mokard.com/WSV26/PointRequest.asmx?WSDL"
		response = mokard.request "GetUserInfo" do
			http.headers["SOAPAction"] = "http://tempuri.org/GetUserInfo"
			soap.body = {
				"MerchantNo" => "1590",
				"UserName" => session[:username].to_s,
				"Channel" => "Novasol"
			}
		end

		mem = response.body[:get_user_info_response][:get_user_info_result][:return_value]

		data.update ({
			:mem_id => mem[:mobile],
			:mem_name => mem[:user3_user_name],
			:mem_email => mem[:email],
			:mem_mobile => mem[:mobile]
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

		detail = []
		detail_name = ""
		total_fee = 0
		ActiveSupport::JSON.decode(params[:detail]).each_with_index do |(productid, amount), index|
			item = {}

			item[:product_id] = productid
			item[:amount] = amount
			item[:detail_id] = index

			product = Product.find :first, :conditions => { :product_id => productid }
			item[:product_name] = product.product_name
			item[:price] = product.price
			item[:retail] = product.retail

			detail.push item
			detail_name += product.product_name + " * " + amount.to_s + ", "
			total_fee += product.retail.to_f * amount.to_f
		end
		detail_name = detail_name.slice 0..-3

		if params[:inv_flag]
			data.update ({ :inv_flag => params[:inv_flag] })

			if params[:inv_title]
				data.update ({ :inv_title => params[:inv_title] })
			end
		end

		payment_code = { 1 => 11, 2 => 2 };
		payment_price = { 1 => 0, 2 => 0 };

		data.update ({
			:detail => detail.to_json,
			:payment => payment_code[params[:payment].to_i],
			:ship => payment_price[params[:payment].to_i],
			:ship_sched => params[:ship_sched],
			:expected_total_fee => total_fee + payment_price[params[:payment].to_i]
		})

		@order = Order.new data

		respond_to do |format|
			if @order.save
				format.html { render :html => @order }
				format.json { render :json => { :status => "1", :orderid => data[:order_id], :detailname => detail_name } }
			else
				format.html { render :html => @order.errors, :status => :unprocessable_entity }
				format.json { render :json => @order.errors, :status => :unprocessable_eneity }
			end
		end
	end


	# POST /order/callback
	# POST /order/callback.json
	def callback
	end


end
