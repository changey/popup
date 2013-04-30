class UsersController < ApplicationController
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
end
