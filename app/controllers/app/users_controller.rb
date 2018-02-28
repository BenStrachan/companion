class App::UsersController < App::BaseController
  def profile
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update user_params
      redirect_to profile_app_users_path,
                  notice: "User has beed updated successfully"
    else
      render :profile
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :run,
                                  :password, :password_confirmation, :status, :avatar)
  end
end