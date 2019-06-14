class AdminsystemsController < ApplicationController
  before_action :check
  before_action :is_super_admin

  def adminsystem 
    @user =User.all
  end

  def revokeadmin
    u = User.find_by(id: params[:user_id])
    u.update(admin: false)
    redirect_back fallback_location: "/adminsystem"
  end

  def revokesuperadmin
    u = User.find_by(id: params[:user_id])
    u.update(superadmin: false)
    redirect_back fallback_location: "/adminsystem"
  end

  def makeadmin
    u = User.find_by(id: params[:user_id])
    u.update(admin: true)
    redirect_back fallback_location: "/adminsystem"
  end

  def makesuperadmin
    u = User.find_by(id: params[:user_id])
    u.update(superadmin: true)
    redirect_back fallback_location: "/adminsystem"
  end
end
