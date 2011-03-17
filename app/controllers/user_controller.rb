#user_controller.rb
class UserController < ApplicationController
  load_and_authorize_resource
  
  def index
    @users = User.excludes(:id => current_user.id)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
  def edit
    #@user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @name = @user.username.to_s
    if user_signed_in? && current_user.admin?
      if @user.destroy
        flash[:notice] = "Successfully deleted <#{@name}> user."
        redirect_to root_path
      else
        flash[:notice] = "Deleting user <#{@name}> failed."
        redirect_to root_path
      end
    else
      flash[:notice] = "You cannot delete user <#{@name}>."
      redirect_to root_path
    end
  end
  
  
  
  
  
end