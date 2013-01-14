class UsersecretsController < ApplicationController
  # GET users/1/usersecrets
  # GET users/1/usersecrets.json
  def index
    @user = User.find(params[:user_id])
    @usersecrets = @user.usersecrets

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @usersecrets }
    end
  end

  # GET users/1/usersecrets/1
  # GET users/1/usersecrets/1.json
  def show
    @user = User.find(params[:user_id])
    @usersecret = @user.usersecrets.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @usersecret }
    end
  end

  # GET users/1/usersecrets/new
  # GET users/1/usersecrets/new.json
  def new
    @user = User.find(params[:user_id])
    @usersecret = @user.usersecrets.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @usersecret }
    end
  end

  # GET users/1/usersecrets/1/edit
  def edit
    @user = User.find(params[:user_id])
    @usersecret = @user.usersecrets.find(params[:id])
  end

  # POST users/1/usersecrets
  # POST users/1/usersecrets.json
  def create
    @user = User.find(params[:user_id])
    @usersecret = @user.usersecrets.build(params[:usersecret])

    respond_to do |format|
      if @usersecret.save
        format.html { redirect_to([@usersecret.user, @usersecret], :notice => 'Usersecret was successfully created.') }
        format.json { render :json => @usersecret, :status => :created, :location => [@usersecret.user, @usersecret] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @usersecret.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT users/1/usersecrets/1
  # PUT users/1/usersecrets/1.json
  def update
    @user = User.find(params[:user_id])
    @usersecret = @user.usersecrets.find(params[:id])

    respond_to do |format|
      if @usersecret.update_attributes(params[:usersecret])
        format.html { redirect_to([@usersecret.user, @usersecret], :notice => 'Usersecret was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @usersecret.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE users/1/usersecrets/1
  # DELETE users/1/usersecrets/1.json
  def destroy
    @user = User.find(params[:user_id])
    @usersecret = @user.usersecrets.find(params[:id])
    @usersecret.destroy

    respond_to do |format|
      format.html { redirect_to user_usersecrets_url(user) }
      format.json { head :ok }
    end
  end
end
