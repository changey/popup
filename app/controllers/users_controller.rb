class UsersController < ApplicationController
  #the method to show a specific user
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  #the method to create a new user
  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:success] = "Welcome to the Netwoek Stickies App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  

  private

  #the method to sign in a user
  def signed_in_user
    redirect_to signin_path, notice: "Please sign in." unless signed_in?
  end

  #the method to check if the user is the authorized user to view a note
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
