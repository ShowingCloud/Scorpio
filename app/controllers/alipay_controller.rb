class AlipayController < ApplicationController


	# POST alipay/pay
	# POST alipay/pay.json
	def pay

		parameters = {
			:service => Refinerycms::Application.config.alipay_service,
			:partner => Refinerycms::Application.config.alipay_pid,
			:_input_charset => Refinerycms::Application.config.alipay_input_charset,
			:notify_url => "http://novasol.com.cn" + Refinerycms::Application.config.alipay_notify_uri,
			:callback_url => "http://novasol.com.cn" + Refinerycms::Application.config.alipay_return_uri,
			:out_trade_no => "12345678",
			:subject => "nothing",
			:payment_type => "1",
			:seller_id => Refinerycms::Application.config.alipay_pid,
			:total_fee => "0.01"
		}

		cleartxt = parameters.map { |k, v| "#{k}=#{v}" }.sort().join ('&')

		parameters.update ({
			:sign_type => Refinerycms::Application.config.alipay_sign_type,
			:sign => Digest::MD5.hexdigest(cleartxt + Refinerycms::Application.config.alipay_key)
		})

		url = Refinerycms::Application.config.alipay_gateway + "?" + parameters.to_param

		respond_to do |format|
			format.html { redirect_to "/" }
			format.json { render :json => { :status => 1, :url => url } }
		end

	end


	# GET alipay/callback
	# GET alipay/callback.json
	def callback
	end


	# POST alipay/notify
	# POST alipay/notify.json
	def notify
	end


	private

	# Alipay.alipay_pid
	# Alipay.alipay_key
end
