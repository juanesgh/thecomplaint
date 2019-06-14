class GeofencesController < ApplicationController
    before_action :check
    before_action :is_super_admin

    def admins
        #muestra lista de usuarios admins, y envia el id por params a viewadmin
        @usr = User.all.where(admin: true)
    end

    def viewadmin
        @usr_id = params[:user_id]
        @fence = UserPlace.find_by(user_id: @usr_id)
    end

    def as
        @usr_id = params[:user_id]
    end

    def addfences
        @usr_id = params[:user_id]
    end

    def removefence
        @usr_id = params[:user_id]
        UserPlace.find_by(id: params[:fence_id]).delete
        redirect_to controller: 'geofences', action: 'viewadmin', user_id: @usr_id
    end

    def checkfence
        city = params[:location]
        usr = params[:user_id]
        val = Geocoder.search(city)
        if val[0] != nil
            ci = val
            city2 = ci.first.city + ", " + ci.first.country
            place = UserPlace.create(user_id: usr, location: city2)
            if place.save
                flash[:success] = "Fence added correctly."
            else
                flash[:failure] = "Something went wrong"
            end
        else
            flash[:failure] = "The entered data is not correct or available."
        end
        redirect_to controller: 'geofences', action: 'viewadmin', user_id: usr
    end
end
