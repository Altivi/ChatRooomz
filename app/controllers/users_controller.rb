class UsersController < ApplicationController
  
  before_action :find_user, only: [:edit, :update]
  
  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = "You have successfully signed up!"
      redirect_to root_url
    else
      render 'new'
    end
  end 

  def edit
  	
  end

  def update
  	if @user.update_attributes(user_params)
      flash.now[:success] = "Profile updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end

    def find_user
    	@user = User.find(params[:id])
    end

end
