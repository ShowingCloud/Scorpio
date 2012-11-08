#encoding: utf-8
require 'digest/sha2'
require 'json'

class MembershipsController < ApplicationController

	WSDL = "http://www.mokard.com/WSV26/PointRequest.asmx?WSDL"


	def index
		redirect_to("/")
	end


	def show
		redirect_to("/")
	end


	def verifymobile
		resp = query_mokard("VerfiedMobileBySMS", {
			"Mobile" => params[:mobile].to_s
		})

		resp = resp[:verfied_mobile_by_sms_response][:verfied_mobile_by_sms_result]
		render(:text => resp.to_json)
	end


	def login
		session[:username] = nil
		session[:login] = nil

		resp = query_mokard("Login", {
			"MerchantNo" => "1590",
			"UserName" => params[:username].to_s,
			"Channel" => "Novasol",
			"PassWord" => Digest::SHA256.hexdigest(params[:password].to_s).slice(0, 32)
		})
		resp = resp[:login_response][:login_result]

		if resp[:status] == "1"
			session[:username] = params[:username]
			session[:login] = true
		end

		render(:text => resp.to_json)
	end


	def logout
		session[:username] = nil
		session[:login] = nil

		redirect_to('/')
	end


	def register
		session[:username] = nil
		session[:login] = nil

		resp = query_mokard("Regist", {
			"MerchantNo" => "1590",
			"UserName" => params[:username].to_s,
			"PassWord" => Digest::SHA256.hexdigest(params[:password].to_s).slice(0, 32),
			"Mobile" => params[:mobile].to_s,
			"VerificationCode" => params[:verification].to_s,
			"Channel" => "Novasol",
			"UserInfo" => nil
		})
		resp = resp[:regist_response][:regist_result]

		if resp[:status] == "1"
			session[:username] = params[:username]
			session[:login] = true
		end

		render(:text => resp.to_json)
	end


	def fillinfo
		resp = query_mokard("UpdateUserInfo", {
			"MerchantNo" => "1590",
			"UserName" => session[:username].to_s,
			"Channel" => "Novasol",
			"UserInfo" => {
				"nickName" => params[:fullname].to_s,
				"mobile" => params[:telephone].to_s,
				"email" => params[:email].to_s,
				"genderID" => params[:gender].to_s,
				"column1" => params[:age].to_s,
				"column2" => params[:contactaddr].to_s,
				"column3" => params[:height].to_s,
				"column4" => params[:weight].to_s,
				"column5" => params[:education].to_s,
				"column6" => params[:career].to_s,
				"column7" => params[:income].to_s,
				"column8" => params[:haveused].to_s,
				"column9" => params[:source].to_s
		}})
		resp = resp[:update_user_info_response][:update_user_info_result]

		if resp[:status] == "1"
			addpoint = query_mokard("CalculatePoints", {
				"isOutRegister" => "false",
				"order" => {
					"FitObjectType" => "100",
					"PointType" => "4",
					"Channel" => "Novasol",
					"UserName" => session[:username].to_s,
					"MerchantNo" => "1590",
					"OrderNo" => "0",
					"Name" => "Registration",
					"TotalFee" => "0.0",
					"CarriageFee" => "0.0",
					"DiscountFee" => "0.0",
					"CreateDate" => DateTime.now()
			}})
			addpoint = addpoint[:calculate_points_response][:calculate_points_result]
		end

		render(:text => resp.to_json)
	end


	def getinfo
		resp = query_mokard("GetUserInfo", {
			"MerchantNo" => "1590",
			"UserName" => session[:username].to_s,
			"Channel" => "Novasol"
		})

		resp = resp[:get_user_info_response][:get_user_info_result]
		render(:text => resp.to_json)
	end


	def getpoint
		resp = query_mokard("GetPoints", {
			"merchantNo" => "1590",
			"username" => session[:username].to_s,
			"channel" => "Novasol",
			"type" => "1"
		})

		resp = resp[:get_points_response][:get_points_result]
		render(:text => resp.to_json)
	end


	def getpointlist
		resp = query_mokard("GetPointListData", {
			"MerchantNo" => "1590",
			"UserName" => session[:username].to_s,
			"Channel" => "Novasol",
			"PointStatus" => "",
			"PointType" => "",
			"StartDate" => "",
			"EndDate" => "",
			"PointStartNum" => "",
			"PointEndNum" => "",
			"CurrentPage" => "0",
			"EachPageCount" => "100"
		})

		resp = resp[:get_point_list_data_response][:get_point_list_data_result]
		render(:text => resp.to_json)
	end


	def neworder

		if session[:username] != nil

			resp = query_mokard("GetUserInfo", {
				"MerchantNo" => "1590",
				"UserName" => session[:username].to_s,
				"Channel"=> "Novasol"
			})
			resp = resp[:get_user_info_response][:get_user_info_result][:return_value]

		end

		if params[:username] == nil and params[:phone] == nil and params[:email] == nil

			if session[:username] == nil
				render(:text => {:status => "0"}.to_json)
				return
			end

			inq = {
				:name => resp[:nick_name].to_s,
				:phone => resp[:mobile].to_s,
				:email => resp[:email].to_s,
				:message => "new order"
			}
			inq[:message] += " num = " + params[:num].to_s unless params[:num] == nil
			inq[:message] += " addr = " + resp[:column2].to_s unless resp[:column2] == nil

		else

			if session[:username] != nil
				params[:phone] = resp[:mobile] if params[:phone] == "" or params[:phone].length < 8
			end

			inq = {
				:name => params[:username].to_s,
				:phone => params[:phone].to_s,
				:email => params[:email].to_s,
				:message => params[:gender].to_s + params[:age].to_s
			}
			inq[:message] += " exist user: " + resp[:nick_name] + "," unless session[:username] == nil
			inq[:message] += "\n\n" + params[:message]

		end

		@inquiry = ::Refinery::Inquiries::Inquiry.new(inq)
		@inquiry[:status] = @inquiry.save ? "1" : "0"

		render(:text => @inquiry.to_json)
	end


	private

	def query_mokard(method, data)
		mokard = Savon.client(WSDL)

		response = mokard.request method do
			http.headers["SOAPAction"] = "http://tempuri.org/" + method
#			soap.version = 2
			soap.body = data
		end

		return response.body
	end

end
