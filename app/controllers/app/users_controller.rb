class App::UsersController < App::BaseController
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update user_params
      redirect_to edit_app_user_path(@user),
                  notice: "User has beed updated successfully"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :run,
                                  :password, :password_confirmation, :status, :avatar)
  end
end