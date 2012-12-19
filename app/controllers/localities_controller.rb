class LocalitiesController < ApplicationController

	respond_to :html, :json, :xml

	# GET /localities
	def index
		@locality = Locality.find :all
		respond_with @locality
	end

	# POST /localities
	def create
		@locality = Locality.new params[:locality]
		@locality.save
		respond_with @locality
	end

	# GET /localities/new
	def new
		@locality = Locality.new
		respond_with @locality
	end

	# GET /localities/:id/edit
	def edit
		@locality = Locality.find params[:id]
	end

	# GET /localities/:id
	def show
		@locality = Locality.find params[:id]

		@children = Locality.find :all, :conditions => { :parent => params[:id] }
		@locality[:children] = @children

		respond_with @locality
	end

	# PUT /localities/:id
	def update
		@locality = Locality.find params[:id]
		@locality.update_attributes params[:locality]
		respond_with @locality
	end

	# DELETE /localities/:id
	def destroy
		@locality = Locality.find params[:id]
		@locality.destroy
		respond_with @locality
	end
end
