class UsersController < ApplicationController
  
  def index
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :passward, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_year, :birth_month, :birth_day )
  end

end