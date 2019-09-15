class UsersController < ApplicationController
  def new
    @users = User.new
  end

  def show
    @users = User.find(params[:id])
  end

end
