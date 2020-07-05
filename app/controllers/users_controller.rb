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

    params.require(:user).permit(:nickname, :text, :password)

  end

end