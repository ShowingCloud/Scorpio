class UseraddrsController < ApplicationController
  # GET users/1/useraddrs
  # GET users/1/useraddrs.json
  def index
    @user = User.find(params[:user_id])
    @useraddrs = @user.useraddrs

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @useraddrs }
    end
  end

  # GET users/1/useraddrs/1
  # GET users/1/useraddrs/1.json
  def show
    @user = User.find(params[:user_id])
    @useraddr = @user.useraddrs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @useraddr }
    end
  end

  # GET users/1/useraddrs/new
  # GET users/1/useraddrs/new.json
  def new
    @user = User.find(params[:user_id])
    @useraddr = @user.useraddrs.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @useraddr }
    end
  end

  # GET users/1/useraddrs/1/edit
  def edit
    @user = User.find(params[:user_id])
    @useraddr = @user.useraddrs.find(params[:id])
  end

  # POST users/1/useraddrs
  # POST users/1/useraddrs.json
  def create
    @user = User.find(params[:user_id])
    @useraddr = @user.useraddrs.build(params[:useraddr])

    respond_to do |format|
      if @useraddr.save
        format.html { redirect_to([@useraddr.user, @useraddr], :notice => 'Useraddr was successfully created.') }
        format.json { render :json => @useraddr, :status => :created, :location => [@useraddr.user, @useraddr] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @useraddr.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT users/1/useraddrs/1
  # PUT users/1/useraddrs/1.json
  def update
    @user = User.find(params[:user_id])
    @useraddr = @user.useraddrs.find(params[:id])

    respond_to do |format|
      if @useraddr.update_attributes(params[:useraddr])
        format.html { redirect_to([@useraddr.user, @useraddr], :notice => 'Useraddr was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @useraddr.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE users/1/useraddrs/1
  # DELETE users/1/useraddrs/1.json
  def destroy
    @user = User.find(params[:user_id])
    @useraddr = @user.useraddrs.find(params[:id])
    @useraddr.destroy

    respond_to do |format|
      format.html { redirect_to user_useraddrs_url(user) }
      format.json { head :ok }
    end
  end
end
