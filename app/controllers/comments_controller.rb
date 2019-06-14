class CommentsController < ApplicationController
    def create
        @com = Comment.create(user_id: current_user.id, post_id: params[:post_id], visible: true, comment: params[:comment]["comment"])
        if @com.save
            flash[:success] = "Comment Submited"
        else
            flash[:success] = "Comment not submited"
        end
        redirect_to Post.find_by(id: params[:post_id])
    end 
end
