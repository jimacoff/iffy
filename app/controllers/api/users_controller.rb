class Api::UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    if @user.save
      login!(@user)
      render json: @user
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :session_token
    )
  end

end