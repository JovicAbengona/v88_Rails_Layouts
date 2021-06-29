class UsersController < ApplicationController
  layout "two_column"

  def index
    @users = User.all
  end

  def create
    user = User.create(user_params)
    if !user.valid?
      flash[:errors] = user.errors.messages
    end
    redirect_to "/users"
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :favorite_language)
    end
end
