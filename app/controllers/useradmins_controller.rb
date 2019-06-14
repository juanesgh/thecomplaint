class UseradminsController < ApplicationController
    before_action :check
    before_action :is_admin
    
    def useradmin
        @users = User.all
    end
    
    def deleteuser
        @us = params[:user]
        @us1 = User.find_by(id: @us)
        @us1.update(deleted: true)
        redirect_back fallback_location: "/useradmins"
    end

    def banuser
        @us = params[:user]
        @us1 = User.find_by(id: @us)
        @us1.update(banned: true)
        redirect_back fallback_location: "/useradmins"
    end

    def blacklistuser
        @us = params[:user]
        @us1 = User.find_by(id: @us)
        User.find(@us).update!(:blacklist => true)
        redirect_back fallback_location: "/useradmins"
    end
end
