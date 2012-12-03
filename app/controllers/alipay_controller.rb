require 'open-uri'

class AlipayController < ApplicationController


	# GET alipay/pay
	# GET alipay/pay.json
	def pay

		order = Order.find :first, :conditions => { :order_id => params[:orderid] }
		total_fee = order.ship

		ActiveSupport::JSON.decode(order.detail).each do |item|
			total_fee += item["retail"].to_f * item["amount"].to_f
		end

		url_base = request.protocol + request.host

		parameters = {
			:service => Refinerycms::Application.config.alipay_service,
			:partner => Refinerycms::Application.config.alipay_pid,
			:_input_charset => Refinerycms::Application.config.alipay_input_charset,
			:notify_url => url_base + Refinerycms::Application.config.alipay_notify_uri,
			:return_url => url_base + Refinerycms::Application.config.alipay_return_uri,
			:out_trade_no => params[:orderid],
			:subject => params[:name],
			:payment_type => "1",
			:seller_id => Refinerycms::Application.config.alipay_pid,
			:total_fee => total_fee.to_s
		}

		cleartxt = parameters.map { |k, v| "#{k}=#{v}" }.sort().join ('&')

		parameters.update ({
			:sign_type => Refinerycms::Application.config.alipay_sign_type,
			:sign => Digest::MD5.hexdigest(cleartxt + Refinerycms::Application.config.alipay_key)
		})

		url = Refinerycms::Application.config.alipay_gateway + "?" + parameters.to_param

		respond_to do |format|
			format.html { redirect_to url }
			format.json { render :json => { :status => 1, :url => url } }
		end

	end


	# GET alipay/callback
	# GET alipay/callback.json
	def callback

		if not params[:is_success] == 'T'
			redirect_to "/" and return
		end

		params.delete "action"
		params.delete "controller"
		params.delete "format"
		params.delete "sign_type"
		sign = params.delete "sign"

		cleartxt = params.map { |k, v| "#{k}=#{v}" }.sort().join ('&')
		cipher = Digest::MD5.hexdigest(cleartxt + Refinerycms::Application.config.alipay_key)

		if not sign == cipher
			redirect_to "/" and return
		end

		server_verification = {
			:service => "notify_verify",
			:partner => Refinerycms::Application.config.alipay_pid,
			:notify_id => params[:notify_id]
		}
		if not open(Refinerycms::Application.config.alipay_gateway + "?" + server_verification.to_param).read == "true"
			redirect_to "/" and return
		end

		order = Order.find :first, :conditions => { :order_id => params[:out_trade_no] }
		order.alipay_cb_buyer_email = params[:buyer_email]
		order.alipay_cb_buyer_id = params[:buyer_id]
		order.alipay_cb_notify_time = params[:notify_time] && params[:notify_time].to_datetime
		order.alipay_cb_total_fee = params[:total_fee].to_f
		order.alipay_cb_trade_no = params[:trade_no]
		order.alipay_cb_trade_status = params[:trade_status]

		if params[:trade_status] == "TRADE_FINISHED" or params[:trade_status] == "TRADE_SUCCESS"
			if params[:total_fee].to_f >= order.expected_total_fee
				order.order_status = 1
				order.pay_status = 1
				order.pay_date = Date.today()
			elsif not order.order_status == 1
				order.order_status = 11
				order.pay_status = 11
				order.pay_date = Date.today()
			end

		elsif not order.order_status == 1
			order.order_status = 12
			order.pay_status = 12
		end

		order.save

		session[:cart] = nil

		respond_to do |format|
			format.html { redirect_to "/pages/50" }
			format.json { render :json => { :status => 1 } }
		end

	end


	# POST alipay/notify
	# POST alipay/notify.json
	def notify

		params.delete "action"
		params.delete "controller"
		params.delete "format"
		params.delete "sign_type"
		sign = params.delete "sign"

		cleartxt = params.map { |k, v| "#{k}=#{v}" }.sort().join ('&')
		cipher = Digest::MD5.hexdigest(cleartxt + Refinerycms::Application.config.alipay_key)

		if not sign == cipher
			redirect_to "/" and return
		end

		server_verification = {
			:service => "notify_verify",
			:partner => Refinerycms::Application.config.alipay_pid,
			:notify_id => params[:notify_id]
		}
		if not open(Refinerycms::Application.config.alipay_gateway + "?" + server_verification.to_param).read == "true"
			redirect_to "/" and return
		end

		order = Order.find :first, :conditions => { :order_id => params[:out_trade_no] }
		order.alipay_nt_notify_time = params[:notify_time] && params[:notify_time].to_datetime
		order.alipay_nt_trade_no = params[:trade_no]
		order.alipay_nt_trade_status = params[:trade_status]
		order.alipay_nt_create_time = params[:gmt_create] && params[:gmt_create].to_datetime
		order.alipay_nt_pay_time = params[:gmt_payment] && params[:gmt_payment].to_datetime
		order.alipay_nt_close_time = params[:gmt_close] && params[:gmt_close].to_datetime
		order.alipay_nt_refund_status = params[:refund_status]
		order.alipay_nt_refund_time = params[:gmt_refund] && params[:gmt_refund].to_datetime
		order.alipay_nt_buyer_email = params[:buyer_email]
		order.alipay_nt_buyer_id = params[:buyer_id]
		order.alipay_nt_total_fee = params[:total_fee].to_f
		order.alipay_nt_discount = params[:discount].to_f

		if params[:trade_status] == "TRADE_FINISHED" or params[:trade_status] == "TRADE_SUCCESS"
			if params[:total_fee].to_f >= order.expected_total_fee
				order.order_status = 1
				order.pay_status = 1
				order.pay_date = Date.today()

				respond_to do |format|
					format.html { redirect "/pages/50" }
					format.json { render :text => "success" }
				end

				order.save
				return

			elsif not order.order_status == 1
				order.order_status = 11
				order.pay_status = 11
				order.pay_date = Date.today()
			end

		elsif not order.order_status == 1
			order.order_status = 12
			order.pay_status = 12
		end

		order.save

		respond_to do |format|
			format.html { redirect "/" }
			format.json { render :text => "failed" }
		end
	end


end
