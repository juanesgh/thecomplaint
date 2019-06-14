class FlagpostsController < ApplicationController
    before_action :check
    before_action :is_admin

    def makeflag
        @pos = params[:post_id]
    end

    def viewflag
        @pos = PostFlag.all.where(post_id: params[:post_id])

    end

    def viewpost
        @post = PostFlag.all.group_by(&:post_id)
    end
    
    def createflag
        PostFlag.create(user_id: current_user.id, comment: params[:comment], category: params[:category], post_id: params[:post_id])
        redirect_to viewpost_path()
    end`
end
