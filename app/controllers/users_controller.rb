class UsersController < ApplicationController
  def new
    @users = User.new
  end

  def show
    @users         = User.find(params[:id])
  end

  def create
    @users = User.new(user_params)
    if @users.save
      redirect_to @users
    else
      render 'new'
    end
  end

  def edit
    @users = User.find(params[:id])
    render :layout => 'users'
  end
    
  def update
    @users = User.find(params[:id])
    if @users.update_attributes(user_params)
      redirect_to @users
      flash[:success] = "プロフィールを更新しました"
    else
      render'show'
    end
  end


private

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation,:image)
    end
end
