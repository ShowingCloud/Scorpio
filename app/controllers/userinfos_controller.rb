class UserinfosController < ApplicationController
  # GET users/1/userinfos
  # GET users/1/userinfos.json
  def index
    @user = User.find(params[:user_id])
    @userinfos = @user.userinfos

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @userinfos }
    end
  end

  # GET users/1/userinfos/1
  # GET users/1/userinfos/1.json
  def show
    @user = User.find(params[:user_id])
    @userinfo = @user.userinfos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @userinfo }
    end
  end

  # GET users/1/userinfos/new
  # GET users/1/userinfos/new.json
  def new
    @user = User.find(params[:user_id])
    @userinfo = @user.userinfos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @userinfo }
    end
  end

  # GET users/1/userinfos/1/edit
  def edit
    @user = User.find(params[:user_id])
    @userinfo = @user.userinfos.find(params[:id])
  end

  # POST users/1/userinfos
  # POST users/1/userinfos.json
  def create
    @user = User.find(params[:user_id])
    @userinfo = @user.userinfos.build(params[:userinfo])

    respond_to do |format|
      if @userinfo.save
        format.html { redirect_to([@userinfo.user, @userinfo], :notice => 'Userinfo was successfully created.') }
        format.json { render :json => @userinfo, :status => :created, :location => [@userinfo.user, @userinfo] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @userinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT users/1/userinfos/1
  # PUT users/1/userinfos/1.json
  def update
    @user = User.find(params[:user_id])
    @userinfo = @user.userinfos.find(params[:id])

    respond_to do |format|
      if @userinfo.update_attributes(params[:userinfo])
        format.html { redirect_to([@userinfo.user, @userinfo], :notice => 'Userinfo was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @userinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE users/1/userinfos/1
  # DELETE users/1/userinfos/1.json
  def destroy
    @user = User.find(params[:user_id])
    @userinfo = @user.userinfos.find(params[:id])
    @userinfo.destroy

    respond_to do |format|
      format.html { redirect_to user_userinfos_url(user) }
      format.json { head :ok }
    end
  end
end
