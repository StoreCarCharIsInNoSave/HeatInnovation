class ProfileController < ApplicationController
  def update
    user_exist
    @user = current_user
  end

  def edit
    user_exist
    @user = current_user
    if params[:user][:password] == params[:user][:password_confirmation] && current_user.update(user_params)
      current_user.avatar=params[:user]['Загрузить фото'] if params[:user]['Загрузить фото']
      flash[:notice] = "Профиль обновлен"
      sign_in(current_user, bypass: true)
      redirect_to profile_update_path
    else
      flash[:alert] = "Проверте правильность введенных данных"
      render :update
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_exist
    if current_user.nil?
      flash[:alert] = "Вы должны войти в систему"
      redirect_to root_path
    end
  end

end
