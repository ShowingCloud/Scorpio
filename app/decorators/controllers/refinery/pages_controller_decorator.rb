#encoding: utf-8
Refinery::PagesController.class_eval do

	before_filter :print_debug_info, :only => [:show]

	protected

	def print_debug_info
		@debug_info = params[:path].to_s + params[:id].to_s
		@debug_info += @page.canonical.to_s
		@debug_info += flash[:debug].to_s

		if @page.canonical[:path].include?("login-page")
			@debug_info += "hello"
		end
	end

end
