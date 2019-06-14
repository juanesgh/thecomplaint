class CommentsController < ApplicationController
    before_action :check
    
    def create
        if !Post.find(params[:post_id]).open or Post.find(params[:post_id]).solved
            flash[:failure] = "Post solved or closed"
        else
            @com = Comment.create(user_id: current_user.id, post_id: params[:post_id], visible: true, comment: params[:comment]["comment"])
            if @com.save
                flash[:success] = "Comment Submited"
            else
                flash[:failure] = "Comment not submited"
            end
        end
        redirect_to Post.find_by(id: params[:post_id])
    end 
end
