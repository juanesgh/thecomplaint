class ChangepasswordsController < ApplicationController

  def changepassword
    if current_user.admin or current_user.superadmin
      @user1 = User.find_by(id: params[:user])
    else
      flash[:failure] = "User without permission"
      redirect_to User.find(current_user.id)
    end
  end
end
