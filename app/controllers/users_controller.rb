class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end
  def show
    @user = current_user
  end
  def friends
    @f= current_user.friends
end
end