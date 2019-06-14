class BlacklistsController < ApplicationController
  before_action :check
  before_action :is_admin
  def blacklist
    if current_user.admin or current_user.superadmin
      @bl = User.all.where(blacklist: true)
    else
      flash[:failure] = "User without permission"
      redirect_to User.find(current_user.id)
    end
  end

  def redeem
    @u = User.find(params[:user])
    @u.update(blacklist: false)
  end
end
