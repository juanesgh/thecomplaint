class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname, :nick, :image, :country, :city, :phone])
        devise_parameter_sanitizer.permit(:update, keys: [:name, :lastname, :nick, :image, :country, :city, :phone]) 
    end
#
    
    def check
        if !user_signed_in?
            flash[:failure] = "User not signed in"
            redirect_to root_path
        end
    end 

    def is_admin
        if !current_user.admin and !current_user.superadmin
            flash[:failure] = "User without permission"
            redirect_to User.find(current_user.id)
        elsif current_user.admin
            pos = UserPlace.all.where(user_id: current_user.id)
            @ip = request.remote_ip
            actual_pos = Geocoder.search(@ip).first.city
            flash[:success] = actual_pos
            v = false
            if pos != nil
                if pos.length <= 1
                    if Geocoder.search(pos[0].location).first.city == actual_pos
                        v = true
                    end
                else 
                    pos.each do |p|
                        if Geocoder.search(p.location).first.city == actual_pos
                            v = true
                        end
                    end
                end
            else
                v = true
            end
            if !v
                #flash[:failure] = "Admin without current location authorization." 
                redirect_to User.find(current_user.id)
            end
        end
    end

    def is_super_admin
        if !current_user.superadmin
            flash[:failure] = "User without permission"
            redirect_to User.find(current_user.id)
        end
    end
end
